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

variable "region" {
  default = "ap-southeast-2"
}

variable "mongodb_atlas_api_pub_key" {
  default = "timykdta"
}
variable "mongodb_atlas_api_pri_key" {
  default = "8e236a24-8f73-417b-a38e-6a0a975c4e6b"
}

variable "mongodb_atlas_org_id" {
  default = "6177d42f7208393fbdb86481"
}

variable "mongodb_atlas_database_username" {
  default = "p3_uat_admin"
}

variable "mongodb_atlas_database_user_password" {
  default = "p3_uat_admin"
}

variable "mongodb_atlas_accesslistip" {
  default = "43.252.113.8"
}
