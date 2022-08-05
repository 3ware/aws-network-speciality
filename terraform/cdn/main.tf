locals {
  bucket_name = "ans-cdn-top10cats-demo-${random_string.random.result}"
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
    ]
  }
}

resource "random_string" "random" {
  length  = 12
  special = false
  upper   = false
}

module "template_files" {
  source  = "hashicorp/dir/template"
  version = "~> v1.0.2"

  base_dir = "${path.module}/static"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> v3.3.0"

  bucket        = local.bucket_name
  force_destroy = true

  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
}

module "s3_bucket_object" {
  for_each = module.template_files.files
  source   = "terraform-aws-modules/s3-bucket/aws//modules/object"
  version  = "~> v3.3.0"

  bucket       = module.s3_bucket.s3_bucket_id
  key          = each.key
  content_type = each.value.content_type
  file_source  = each.value.source_path
}

data "aws_cloudfront_cache_policy" "this" {
  count = var.enable_cloudfront ? 1 : 0
  name  = "Managed-CachingOptimized"
}

module "cdn" {
  count   = var.enable_cloudfront ? 1 : 0
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 2.9.3"

  comment     = "Top 10 Cats CDN"
  enabled     = true
  price_class = "PriceClass_All"

  origin = {
    top10cats = {
      domain_name = module.s3_bucket.s3_bucket_bucket_regional_domain_name
    }
  }

  default_root_object = "index.html"

  default_cache_behavior = {
    use_forwarded_values   = false
    viewer_protocol_policy = "allow-all"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = data.aws_cloudfront_cache_policy.this[0].id
    target_origin_id       = "top10cats"
  }

  viewer_certificate = {
    cloudfront_default_certificate = true
  }
}
