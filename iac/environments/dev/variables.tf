variable "aws_environment" {
  description = "(Required) The AWS environment to deploy resources to"
  type        = string
  nullable    = false
}

variable "aws_project" {
  description = "(Required) The AWS project to deploy resources to"
  type        = string
  default     = "aws-network-speciality"
  nullable    = false
}

variable "aws_region" {
  description = "(Required) The AWS region to deploy resources to"
  type        = string
  default     = "eu-west-2"
  nullable    = false
}

variable "aws_service" {
  description = "(Required) The AWS service being deployed"
  type        = string
  default     = "vpc"
  nullable    = false
}
