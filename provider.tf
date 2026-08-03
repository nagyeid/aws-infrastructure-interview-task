provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-infrastructure-interview-task"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
