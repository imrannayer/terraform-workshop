provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

resource "aws_vpc" "vpc_network" {
  cidr_block       = "10.10.0.0/16"

  tags = {
    Name = "my-tf-vpc-network"
    # Enable following line after resource is created
    # Dept = "IT"
  }
}