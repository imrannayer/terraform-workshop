provider "aws" {
  #N. Virginia
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

provider "aws" {
  # Oregon Region
  region = "us-west-2"
  alias  = "west"
}

resource "aws_vpc" "vpc_network_west" {
  provider    = aws.west
  cidr_block  = "10.100.0.0/16"

  tags = {
    Name = "my-tf-vpc-network-west"
  }
}

resource "aws_vpc" "vpc_network_east" {
  cidr_block  = "10.10.0.0/16"

  tags = {
    Name = "my-tf-vpc-network-east"
  }
}
