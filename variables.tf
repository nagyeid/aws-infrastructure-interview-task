variable "aws_region" {
  description = "AWS region where resources will be deployed."
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}
