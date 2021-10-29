module "compute" {
  source         = "./modules/compute"
  pub_sub_id     = module.network.pub_sub_id 
  prv_sub_id     = module.network.prv_sub_id
  bastion_sg_ids = [module.sg.general_sg_id, module.sg.bastion_sg_id]
  app_sg_ids     = [module.sg.general_sg_id, module.sg.app_sg_id]
  key_name       = var.key_name
  instance_type  = var.instance_type
}

module "network" {
  source             = "./modules/network"
  az                 = var.az
  vpc_cidr_block     = var.vpc_cidr_block
  pub_sub_cidr_block = var.pub_sub_cidr_block
  prv_sub_cidr_block = var.prv_sub_cidr_block
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.network.vpc_id
}