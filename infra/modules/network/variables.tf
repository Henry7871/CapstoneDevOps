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