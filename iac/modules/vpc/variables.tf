variable "aws_environment" {
  description = "(Required) The AWS environment to deploy resources to"
  type        = string
  nullable    = false
}

variable "vpc_cidr_block" {
  description = "(Required) The CIDR block for the VPC"
  type        = string
}

variable "trusted_ips" {
  description = "(Required) Trusted IP addresses for bastion host access"
  type        = set(string)
}

variable "ssh_key" {
  description = "(Required) Trusted keys for bastion host access"
  type        = string
}
