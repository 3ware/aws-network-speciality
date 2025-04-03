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
  description = "(Optional) Trusted IP addresses for bastion host access"
  type        = set(string)
  default     = []
  nullable    = true
}

variable "ssh_key" {
  description = <<EOT
    (Optional) Trusted keys for bastion host access.
    Providing an SSH key will create the EC2 instances. Leaving it empty will not create the EC2 instances.
    EOT
  type        = string
  default     = ""
}
