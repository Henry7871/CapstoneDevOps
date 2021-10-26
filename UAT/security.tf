resource "aws_security_group" "general_sg" {
  vpc_id      = aws_vpc.main.id

  tags = {
    Project = var.tag
  }
}

resource "aws_security_group_rule" "out_http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.general_sg.id
}



resource "aws_security_group" "nginx_sg" {
  vpc_id      = aws_vpc.main.id
  tags = {
    Project = var.tag
  }
}

resource "aws_security_group_rule" "in_ssh_bastion_from_anywhere" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nginx_sg.id
}

resource "aws_security_group_rule" "out_ssh_bastion_to_anywhere" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nginx_sg.id
}



resource "aws_security_group" "app_sg" {
  vpc_id      = aws_vpc.main.id
  tags = {
    Project = var.tag
  }
}

resource "aws_security_group_rule" "in_ssh_app_from_anywhere" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "out_http_app_to_anywhere" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
}