terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.74"
    }
  }
  required_version = "1.9.8"

  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Automation  = "true"
      Environment = var.environment
      Owner       = "terraform"
    }
  }
}