provider "aws" {
  region                  = var.az
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}