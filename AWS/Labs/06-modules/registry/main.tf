provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-registry-vpc"
  cidr = "10.10.0.0/16"
  tags = {
    Environment = "dev"
  }
}
output myvpc {
  value = module.vpc
}
