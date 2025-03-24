terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90"
    }
  }

  cloud {
    organization = "3ware"

    workspaces {
      project = var.aws_project
      name    = "${var.aws_environment}-${var.aws_region}-${var.aws_service}"

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

  aws_environment = "development"
  trusted_ips     = ["192.0.2.1/32"]
  ssh_key         = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNSplDEGibL7tUs87JsuwnHmDA2uSB+M2kUlOQuI0Fc"
}
