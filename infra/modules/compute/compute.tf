data "aws_ssm_parameter" "linux_latest_ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "jump_box" {
    ami = data.aws_ssm_parameter.linux_latest_ami.value
    instance_type = "t2.micro"
    key_name = "sdn_tutorial_key"

    subnet_id = var.pub_sub_id
    vpc_security_group_ids = var.bastion_sg_ids

    tags = {
        Project = "sdn-tutorial"
    }
}


resource "aws_instance" "app_instance" {
  ami           = data.aws_ssm_parameter.linux_latest_ami.value
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id              = var.prv_sub_id 
  vpc_security_group_ids = var.app_sg_ids

  tags = {
    Project = "sdn-tutorial"
  }
}