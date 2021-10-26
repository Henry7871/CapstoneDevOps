module "compute" {
  source         = "./modules/compute"
  pub_sub_id     = aws_subnet.pub_sub.id
  bastion_sg_ids = [aws_security_group.general_sg.id, aws_security_group.nginx_sg.id]
  app_sg_ids     = [aws_security_group.general_sg.id, aws_security_group.app_sg.id]
}