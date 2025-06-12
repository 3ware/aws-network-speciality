provider "aws" {
  profile = "3ware-org"
  region  = var.aws_region
  default_tags {
    tags = {
      "3ware:project-id"      = var.aws_project
      "3ware:environment"     = var.aws_environment
      "3ware:service"         = var.aws_service
      "3ware:managed-by-tofu" = true
      "3ware:hcp-workspace"   = terraform.workspace
    }
  }
}
terraform {
  required_version = ">= 1.9, < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100"
    }
  }

  cloud {
    organization = "3ware"
    hostname     = "app.terraform.io"
    workspaces {
      project = var.aws_project
      name    = "${var.aws_service}-${var.aws_region}-${var.aws_environment}"
    }
  }
}
