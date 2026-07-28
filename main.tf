module "aws_vpc" {
  source      = "./modules/vpc"
  vpc_name    = "sphere-vpc"
  vpc_cidr    = "10.0.0.0/16"
  environment = "dev"

}

module "secuirity-groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.aws_vpc.vpc_id
  environment  = var.environment
  project_name = var.project_name



}

