variable "az" {
  description = "Availability Zone"
  type = string
  # default = "us-east-1a"
}

variable "instance_type" {
  description = "AWS EC2 type"
  type = string
  # default = "t2.micro"
}

variable "key_name" {
  description = "SSH public key name"
  type = string
  # default = "sdn_tutorial_key"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  type = string
  # default = "172.16.0.0/16"
}

variable "pub_sub_cidr_block" {
  description = "public subnet cidr block"
  type = string
  # default = "172.16.1.0/24"
}

variable "prv_sub_cidr_block" {
  description = "private subnet cidr block"
  type = string
  # default = "172.16.4.0/24"
}