provider "aws" {
  region = "us-east-1"
}

variable "environment" {}

# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role_${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

# Lambda Function using ECR Image
resource "aws_lambda_function" "node_lambda" {
  function_name    = "nodejs-api-lambda-${var.environment}"
  image_uri       = "${aws_ecr_repository.node_ecr.repository_url}:latest"
  package_type    = "Image"
  role            = aws_iam_role.lambda_exec_role.arn

  environment {
    variables = {
      JWT_SECRET = "your-secret-key"
    }
  }
}
