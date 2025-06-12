# AWS Advanced Network CloudTrail Demo

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9, < 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.100 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assumable_role"></a> [iam\_assumable\_role](#module\_iam\_assumable\_role) | git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-assumable-role | 89fe17a6549728f1dc7e7a8f7b707486dfb45d89 |
| <a name="module_iam_policy"></a> [iam\_policy](#module\_iam\_policy) | git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-policy | 89fe17a6549728f1dc7e7a8f7b707486dfb45d89 |
| <a name="module_log_group"></a> [log\_group](#module\_log\_group) | git::https://github.com/terraform-aws-modules/terraform-aws-cloudwatch.git//modules/log-group | 235046ca1ff83ada5f9265583ed96c8b675b0468 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git | 8a0b697adfbc673e6135c70246cff7f8052ad95a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_environment"></a> [aws\_environment](#input\_aws\_environment) | The environment to deploy the AWS resources into | `string` | `"global"` | no |
| <a name="input_aws_project"></a> [aws\_project](#input\_aws\_project) | (Required) The AWS project to deploy resources to | `string` | `"aws-network-speciality"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the resources into | `string` | `"us-east-1"` | no |
| <a name="input_aws_service"></a> [aws\_service](#input\_aws\_service) | The service to deploy the AWS resources for | `string` | `"org"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
