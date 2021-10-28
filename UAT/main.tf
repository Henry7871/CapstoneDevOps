module "compute" {
  source         = "./modules/compute"
  pub_sub_id     = aws_subnet.pub_sub.id
  bastion_sg_ids = [aws_security_group.general_sg.id, aws_security_group.nginx_sg.id]
  app_sg_ids     = [aws_security_group.general_sg.id, aws_security_group.app_sg.id]
}

#
# Example Terraform Config to create a
# MongoDB Atlas Shared Tier Project, Cluster,
# Database User and Project IP Whitelist Entry
#
# First step is to create a MongoDB Atlas account
# https://docs.atlas.mongodb.com/tutorial/create-atlas-account/
#
# Then create an organization and programmatic API key
# https://docs.atlas.mongodb.com/tutorial/manage-organizations
# https://docs.atlas.mongodb.com/tutorial/manage-programmatic-access
#
# Terraform MongoDB Atlas Provider Documentation
# https://www.terraform.io/docs/providers/mongodbatlas/index.html
# Terraform 0.14+, MongoDB Atlas Provider 0.9.1+



provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_api_pub_key
  private_key = var.mongodb_atlas_api_pri_key
}

#
# Create a Project
#
resource "mongodbatlas_project" "my_project" {
  name   = "p3-henry"
  org_id = var.mongodb_atlas_org_id
}

#
# Create a Shared Tier Cluster
#
resource "mongodbatlas_cluster" "my_cluster" {
  project_id              = mongodbatlas_project.my_project.id
  name                    = "p3-uat"

  # Provider Settings "block"
  provider_name = "TENANT"

  # options: AWS AZURE GCP
  backing_provider_name = "AWS"

  # options: M2/M5 atlas regions per cloud provider
  # GCP - CENTRAL_US SOUTH_AMERICA_EAST_1 WESTERN_EUROPE EASTERN_ASIA_PACIFIC NORTHEASTERN_ASIA_PACIFIC ASIA_SOUTH_1
  # AZURE - US_EAST_2 US_WEST CANADA_CENTRAL EUROPE_NORTH
  # AWS - US_EAST_1 US_WEST_2 EU_WEST_1 EU_CENTRAL_1 AP_SOUTH_1 AP_SOUTHEAST_1 AP_SOUTHEAST_2
  provider_region_name = "AP_SOUTHEAST_1"

  # options: M2 M5
  provider_instance_size_name = "M0"

  # Will not change till new version of MongoDB but must be included
  mongo_db_major_version = "4.4"
  auto_scaling_disk_gb_enabled = "false"
}

#
# Create an Atlas Admin Database User
#
resource "mongodbatlas_database_user" "my_user" {
  username           = var.mongodb_atlas_database_username
  password           = var.mongodb_atlas_database_user_password
  project_id         = mongodbatlas_project.my_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "p3_uat_db"
  }
}

#
# Create an IP Accesslist
#
# can also take a CIDR block or AWS Security Group -
# replace ip_address with either cidr_block = "CIDR_NOTATION"
# or aws_security_group = "SECURITY_GROUP_ID"
#
resource "mongodbatlas_project_ip_access_list" "my_ipaddress" {
      project_id = mongodbatlas_project.my_project.id
      ip_address = var.mongodb_atlas_accesslistip
      comment    = "Anywhere"
}

# Use terraform output to display connection strings.
output "connection_strings" {
  value = mongodbatlas_cluster.my_cluster.connection_strings.0.standard_srv
}