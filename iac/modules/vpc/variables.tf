variable "aws_environment" {
  description = <<EOT
    (Required) The AWS environment to deploy resources to.
    Valid values are: development, testing, staging, production.
    EOT
  type        = string
  nullable    = false
  validation {
    condition = contains(["sandbox", "development", "testing", "staging", "production"], var.aws_environment)
    error_message = format(
      "Invalid environment provided. Received: '%s', Require: '%v'.\n%s",
      var.aws_environment,
      join(", ", ["sandbox", "development", "testing", "staging", "production"]),
      "Change the environment variable value to one that is permitted."
    )
  }
}

variable "vpc_cidr_block" {
  description = "(Required) A valid CIDR block to assign to the VPC"
  type        = string

  validation {
    condition = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = format(
      "Invalid CIDR block provided. Received: '%s'\n%s",
      var.vpc_cidr_block,
      "Check the syntax of the CIDR block is valid."
    )
  }
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
