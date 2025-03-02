terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.region
}

# Create ECR Repository
module "ecr" {
  source    = "./modules/ECR"
  repo_name = var.repo_name
}

# IAM Role for Lambda
module "iam" {
  source = "./modules/IAM"
}

# Lambda Function (including API Gateway & Cognito)
module "lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  lambda_role_arn      = module.iam.lambda_role_arn
  image_name           = "${module.ecr.ecr_repository_url}:latest"
}
