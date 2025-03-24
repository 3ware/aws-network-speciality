variable "aws_environment" {
  description = "The environment to deploy the AWS resources into"
  type        = string
  default     = "global"
}

variable "aws_project" {
  description = "(Required) The AWS project to deploy resources to"
  type        = string
  default     = "aws-network-speciality"
  nullable    = false
}

variable "aws_region" {
  description = "The AWS region to deploy the resources into"
  type        = string
  default     = "us-east-1"
}

variable "aws_service" {
  description = "The service to deploy the AWS resources for"
  type        = string
  default     = "org"
}
