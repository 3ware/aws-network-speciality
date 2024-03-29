# AWS Advanced Network CloudTrail Demo

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.2.0  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.71.0 |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.24.0  |

## Modules

| Name                                                                                      | Source                                                    | Version   |
| ----------------------------------------------------------------------------------------- | --------------------------------------------------------- | --------- |
| <a name="module_iam_assumable_role"></a> [iam_assumable_role](#module_iam_assumable_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> v5.2.0 |
| <a name="module_iam_policy"></a> [iam_policy](#module_iam_policy)                         | terraform-aws-modules/iam/aws//modules/iam-policy         | ~> v5.2.0 |
| <a name="module_log_group"></a> [log_group](#module_log_group)                            | terraform-aws-modules/cloudwatch/aws//modules/log-group   | ~> 3.3.0  |
| <a name="module_s3_bucket"></a> [s3_bucket](#module_s3_bucket)                            | terraform-aws-modules/s3-bucket/aws                       | ~> 3.3.0  |

## Resources

| Name                                                                                                                                                | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail)                                       | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                       | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)         | data source |
| [aws_iam_policy_document.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)            | data source |
| [aws_organizations_organization.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                                         | data source |

## Inputs

No inputs.

## Outputs

No outputs.

<!-- END_TF_DOCS -->
