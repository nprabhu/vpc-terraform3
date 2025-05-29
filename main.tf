# VPC 
module "vpc" {
  source           = "./modules/VPC"
  cidr_block_range = var.cidr_block_range
  cidr_block_route = var.cidr_block_route
}

#SeCurity Group
module "security-group" {
  source = "./modules/SECURITY GROUP"
  vpc_id = module.vpc.vpc_id
  ingress_ports = var.ingress_ports
  cidr_block_range = var.cidr_block_range
}

#EC2 instance 
module "ec2_instance" {
  source = "./modules/EC2"
  instance_type = var.instance_type
  subnet_ids_public   = module.vpc.subnet_ids_public
  subnet_ids_private   = module.vpc.subnet_ids_private
  sg_id = module.security-group.sg_id
}

