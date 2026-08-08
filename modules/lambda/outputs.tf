output "function_name" {
  description = "Name of the Lambda function."
  value       = aws_lambda_function.current_time.function_name
}

output "function_arn" {
  description = "ARN of the Lambda function."
  value       = aws_lambda_function.current_time.arn
}