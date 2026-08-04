variable "vpc_id" {
  description = "ID of the VPC where the EC2 instance will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "ID of the public subnet where the EC2 instance will be deployed."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

