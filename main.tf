module "aws_vpc" {
  source      = "./modules/vpc"
  vpc_name    = "sphere-vpc"
  vpc_cidr    = "10.0.0.0/16"
  environment = "dev"

}

