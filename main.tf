module "network" {
  source = "./modules/network"

  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "eu-west-2a"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id

  instance_type = "t3.micro"
}

module "lambda" {
  source = "./modules/lambda"

  function_name = "interview-current-time"
}