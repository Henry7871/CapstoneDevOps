module "compute" {
  source         = "./modules/compute"
  pub_sub_id     = module.network.aws_subnet.pub_sub.id
  prv_sub_id     = module.network.aws_subnet.prv_sub.id
  bastion_sg_ids = [module.sg.aws_security_group.general_sg.id, module.sg.aws_security_group.bastion_sg.id]
  app_sg_ids     = [module.sg.aws_security_group.general_sg.id, module.sg.aws_security_group.app_sg.id]
  key_file       = var.key_name
  instance_type  = var.instance_type
}

module "network" {
    source       = "./modules/network"
    az           = var.az
    vpc_cidr_block = var.vpc_cidr_block
    pub_sub_cidr_block = var.pub_sub_cidr_block
    prv_sub_cidr_block = var.prv_sub_cidr_block
}

module "sg" {
    source = "./modules/sg"
    vpc_id = module.network.aws_vpc.main.id
}