variable "aws_environment" {
  description = "The environment to deploy the AWS resources into"
  type        = string
  default     = "glb"
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
