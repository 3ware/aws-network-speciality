provider "aws" {
  profile = "ans-gen"
  region  = "us-east-1"

  default_tags {
    tags = {
      "Project"     = "aws-network-specialty"
      "Environment" = "Dev"
      "Service"     = "CDN"
      "Terraform"   = true
    }
  }
}

terraform {
  required_version = ">= 1.7.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.71.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.2"
    }
  }

  cloud {
    organization = "3ware"
    hostname     = "app.terraform.io"
    workspaces {
      name = "aws-net-spec-cdn"
    }
  }
}
