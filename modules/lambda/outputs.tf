# Export Lambda Invoke ARN
output "lambda_invoke_arn" {
  value = aws_lambda_function.timestamp_lambda.invoke_arn
}
