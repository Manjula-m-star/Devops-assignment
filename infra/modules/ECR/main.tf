terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Set an appropriate AWS provider version
    }
  }
  required_version = ">= 1.0.0"  # Set your Terraform version requirement
}

resource "aws_ecr_repository" "app_repo" {
  name = "my-ecr-repo"
}
