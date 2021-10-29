variable "pub_sub_id" {
  type = string
}

variable "prv_sub_id" {
  type = string
}

variable "bastion_sg_ids" {
  type = list
}

variable "app_sg_ids" {
  type = list
}

variable "key_name" {
  description = "SSH public key name"
  type = string
  # default = "sdn_tutorial_key"
}