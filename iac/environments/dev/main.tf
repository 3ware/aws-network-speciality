terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95"
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

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "3ware:project-id"           = var.aws_project
      "3ware:environment"          = var.aws_environment
      "3ware:service"              = var.aws_service
      "3ware:managed-by-terraform" = true
      "3ware:workspace"            = terraform.workspace
    }
  }
}

module "vpc" {
  source = "../../modules/vpc"

  aws_environment = var.aws_environment
  vpc_cidr_block  = "10.16.0.0/16"
}
