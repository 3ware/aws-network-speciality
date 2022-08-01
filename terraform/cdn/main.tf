locals {
  bucket_name = "3ware-ans-cdn-top10cats-demo"
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
