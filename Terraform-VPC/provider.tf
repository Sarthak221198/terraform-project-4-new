terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    bucket         = "my-terraform-project-3"
    key            = "backend/dev.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}