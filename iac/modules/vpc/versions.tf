terraform {
  required_version = ">=1.9, <2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.69, < 6.0"
    }
  }
}
