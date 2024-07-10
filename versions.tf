terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/home/nhk/.aws/conf"]
  shared_credentials_files = ["/home/nhk/.aws/credentials"]
  profile                  = var.aws_profile
  region                   = var.aws_region
}

