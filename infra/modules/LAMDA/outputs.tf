
output "api_gateway_url" {
  value = aws_apigatewayv2_stage.lambda_stage.invoke_url
}

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn  # ✅ Matches `main.tf`
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.oidc.id  # ✅ Matches `main.tf`
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.oidc_client.id  # ✅ Matches `main.tf`
}
