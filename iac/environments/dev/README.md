<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9, < 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.95 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_environment"></a> [aws\_environment](#input\_aws\_environment) | (Required) The AWS environment to deploy resources to | `string` | n/a | yes |
| <a name="input_aws_project"></a> [aws\_project](#input\_aws\_project) | (Required) The AWS project to deploy resources to | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | (Required) The AWS region to deploy resources to | `string` | n/a | yes |
| <a name="input_aws_service"></a> [aws\_service](#input\_aws\_service) | (Required) The AWS service being deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_hostname"></a> [bastion\_hostname](#output\_bastion\_hostname) | DNS name of the bastion host |
| <a name="output_internal_host_ip"></a> [internal\_host\_ip](#output\_internal\_host\_ip) | IP of the host deployed to private subnet |
| <a name="output_vpc_availability_zones"></a> [vpc\_availability\_zones](#output\_vpc\_availability\_zones) | Availability zone for the VPC |
| <a name="output_vpc_database_subnets_cidr"></a> [vpc\_database\_subnets\_cidr](#output\_vpc\_database\_subnets\_cidr) | CIDR block for the database subnet |
| <a name="output_vpc_private_subnets_cidr"></a> [vpc\_private\_subnets\_cidr](#output\_vpc\_private\_subnets\_cidr) | CIDR block for the private subnet |
| <a name="output_vpc_public_subnets_cidr"></a> [vpc\_public\_subnets\_cidr](#output\_vpc\_public\_subnets\_cidr) | CIDR block for the public subnet |
<!-- END_TF_DOCS -->