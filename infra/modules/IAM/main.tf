# IAM Role for Lambda
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambdaExecRoleHelloWorld"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Basic Execution Policy
resource "aws_iam_role_policy_attachment" "lambda_exec_policy_attachment" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
# ✅ FIX: Output IAM Role ARN so it can be used in main.tf
output "lambda_role_arn" {
  description = "The ARN of the IAM role for Lambda"
  value       = aws_iam_role.lambda_exec_role.arn
}
