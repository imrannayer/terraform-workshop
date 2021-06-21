provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

# Change name of bucket and Create it in your account 

terraform {
  backend "s3" {
    bucket = "<MY_BUCKET_NAME>"
    key    = "hr/network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_vpc" "vpc_network" {
  cidr_block       = "10.10.0.0/16"

  tags = {
    Name = "my-tf-vpc-network"
  }
}