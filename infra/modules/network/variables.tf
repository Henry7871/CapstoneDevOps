variable "az" {
  description = "Availability Zone"
  type = string
  # default = "ap-southeast-2b"
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