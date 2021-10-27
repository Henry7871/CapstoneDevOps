provider "aws" {
  region                  = var.region
  shared_credentials_file = "/Users/Andy/.aws/credentials"
  profile                 = "default"
}