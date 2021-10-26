variable "pub_sub_id" {
  type = string
}

variable "bastion_sg_ids" {
  type = list
}

variable "app_sg_ids" {
  type = list
}

variable "availability_zone" {
  default = "ap-southeast-2a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "p3_uat"
}

variable "tag" {
  default = "Public UAT"
}