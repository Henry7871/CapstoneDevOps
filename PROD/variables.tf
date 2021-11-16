variable "name" {
  description = "the name of your stack, e.g. \"demo\""
  #default = "ECS"
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
  #default     = "PROD"
}

variable "region" {
  # default = "ap-southeast-2"
}

variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region, if set to something other than the defaults, both private_subnets and public_subnets have to be defined as well"
  # default     = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  # default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  # default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  # default     = ["10.0.2.0/24", "10.0.4.0/24"]
}

variable "service_desired_count" {
  description = "Number of tasks running in parallel"
  # default     = 1
}

variable "container_port" {
  description = "The port where the Docker is exposed"
  # default     = 3088
}

variable "container_image" {
  description = "The image name where the Docker is used"
  # default = "docker_image"
}

variable "container_cpu" {
  description = "The number of cpu units used by the task"
  # default     = 256
}

variable "container_memory" {
  description = "The amount (in MiB) of memory used by the task"
  # default     = 512
}

variable "health_check_path" {
  description = "Http path for task health check"
  # default     = "/"
}

variable "mongodb_atlas_api_pub_key" {
  # default = "timykdta"
}

variable "mongodb_atlas_api_pri_key" {
  # default = "8e236a24-8f73-417b-a38e-6a0a975c4e6b"
}

variable "mongodb_atlas_org_id" {
  # default = "6177d42f7208393fbdb86481"
}

variable "mongodb_atlas_database_username" {
  # default = "p3_prod_admin"
}

variable "mongodb_atlas_database_user_password" {
  # default = "p3_prod_admin"
}

variable "mongodb_atlas_accesslistip" {
  # default = "43.252.113.8"
}
