variable "aws_environment" {
  description = "(Required) The AWS environment to deploy resources to"
  type        = string
}

variable "aws_project" {
  description = "(Required) The AWS project to deploy resources to"
  type        = string
}

variable "aws_region" {
  description = "(Required) The AWS region to deploy resources to"
  type        = string
}

variable "aws_service" {
  description = "(Required) The AWS service being deployed"
  type        = string
}

variable "is_local" {
  description = "(Optional) Is this a local environment? `true` sets the provider profile for credentials. `false` does not."
  type        = bool
  default     = false
}
