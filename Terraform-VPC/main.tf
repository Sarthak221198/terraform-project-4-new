module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  project_name = var.project_name
  subnet_cidr = var.subnet_cidr
  subnet_names = var.subnet_names
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  sg_id = module.sg.sg_id
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}

module "alb" {
    source = "./modules/alb"
    sg_id = module.sg.sg_id
    vpc_id = module.vpc.vpc_id
    project_name = var.project_name
    subnet_id = module.vpc.subnet_id
    instances = module.ec2.instances
}