# terraform {
#   required_version = ">= 0.13"

#   required_providers {
#     mongodbatlas = {
#       source = "mongodb/mongodbatlas"
#       version = "1.0.2"
#     }

#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
# }

# provider "mongodbatlas" {
#   public_key  = var.mongodb_atlas_api_pub_key
#   private_key = var.mongodb_atlas_api_pri_key
# }

provider "aws" {
#   access_key = var.aws-access-key
#   secret_key = var.aws-secret-key
  region                  = var.region    
  shared_credentials_file = "/Users/Andy/.aws/credentials"
  profile                 = "default"
}
