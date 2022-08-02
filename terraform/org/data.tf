data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "AWSCloudTrailAclCheck"
    principals {
      type        = "AWS"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
    ]
    resources = [
      "arn:aws:s3:::${local.bucket_name}",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        aws_cloudtrail.this.arn
      ]
    }
  }

  statement {
    sid = "AWSCloudTrailWrite"
    principals {
      type        = "AWS"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${local.bucket_name}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        aws_cloudtrail.this.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "bucket-owner-full-control"
      ]
    }
  }

  statement {
    sid = "AWSCloudTrailWriteOrg"
    principals {
      type        = "AWS"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${local.bucket_name}/AWSLogs/${data.aws_organizations_organization.current.id}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        aws_cloudtrail.this.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values = [
        "bucket-owner-full-control"
      ]
    }
  }
}

data "aws_iam_policy_document" "cloudwatch" {
  statement {
    sid = "AWSCloudTrailCreateLogStream"

    actions = [
      "logs:CreateLogStream",
    ]
    resources = [
      local.log_stream,
    ]
  }
  statement {
    sid = "AWSCloudTrailPutLogEvents"

    actions = [
      "logs:PutEvents",
    ]
    resources = [
      local.log_stream,
    ]
  }
}
