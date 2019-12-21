provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

module "myresource-1" {
  source        = "../modules"
  name_prefix   = "my-first"
}

module "myresource-2" {
  source        = "../modules"
  name_prefix   = "my-second"
}