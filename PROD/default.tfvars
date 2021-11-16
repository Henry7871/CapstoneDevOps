name = "ECS"

environment = "PROD"

region = "ap-southeast-2"

cidr = "10.0.0.0/16"

availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]

public_subnets = ["10.0.1.0/24", "10.0.3.0/24"]

private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]

service_desired_count = 1

container_port = 3088

container_image = "docker_image"

container_cpu = 256

container_memory = 512

health_check_path = "/"

mongodb_atlas_api_pub_key = "timykdta"

mongodb_atlas_api_pri_key = "8e236a24-8f73-417b-a38e-6a0a975c4e6b"

mongodb_atlas_org_id = "6177d42f7208393fbdb86481"

mongodb_atlas_database_username = "p3_prod_admin"

mongodb_atlas_database_user_password = "p3_prod_admin"

mongodb_atlas_accesslistip = "43.252.113.8"

