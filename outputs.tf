output "vpc_id" {
  description = "ID of the VPC."
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = module.network.public_subnet_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 web server."
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 web server."
  value       = module.ec2.public_ip
}

output "api_endpoint" {
  description = "Public API Gateway endpoint for the Lambda function."
  value       = module.api_gateway.api_endpoint
}