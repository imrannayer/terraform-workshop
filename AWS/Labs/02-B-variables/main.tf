provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

variable "x_vpc_name" {
  default = "tf-vpc-network"
  description = "Name of VPC network"
}

variable "x_vpc_cidr" {
  default = "10.10.0.0/16"
  description = "Name of VPC network"
}

resource "aws_vpc" "vpc_network" {
  cidr_block  = var.x_vpc_cidr

  tags = {
    Name      = var.x_vpc_name
  }
}