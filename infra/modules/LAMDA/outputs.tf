
output "api_gateway_url" {
  value = aws_apigatewayv2_stage.lambda_stage.invoke_url
}

output "lambda_function_arn" {
  value = aws_lambda_function.your_lambda_function.arn
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.your_user_pool.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.your_client.id
}
