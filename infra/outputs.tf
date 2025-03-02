output "ecr_repository_url" {
  description = "ECR Repository URL"
  value       = module.ecr.ecr_repository_url
}

output "lambda_function_arn" {
  description = "Lambda function ARN"
  value       = module.lambda.lambda_function_arn
}

output "cognito_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = module.lambda.cognito_user_pool_id
}

output "cognito_client_id" {
  description = "Cognito Client ID"
  value       = module.lambda.cognito_client_id
}

output "api_gateway_url" {
  description = "API Gateway Invoke URL"
  value       = module.lambda.api_gateway_url
}
