terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region  # Use a variable for flexibility
}

terraform {
  backend "s3" {}  # If using AWS S3 as the backend
}
