terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
  backend "s3" {
    bucket = "state-file-s3-queen-python-app"
     key = "terraform/backend/terraform_aws.tfstate"
     region = "us-east-1"
     dynamodb_table = "terraform-s3-backend-locking"
     encrypt = true
  }
}

provider "aws" {
  # Configuration options
}