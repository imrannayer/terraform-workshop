provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}

##################
# Reference Remote state file to get output values

data "aws_vpc" "vpc" {
   #id = "${var.vpc_id}"
   filter {
     name = "tag-key"
     values = ["Name"]
   }
   filter {
     name = "tag-value"
     values = ["my-tf-vpc-network"]
   }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "my-tf-vpc-subnet1"
  }

# Refer to vpc ID
  vpc_id     = data.aws_vpc.vpc.id
}

###########################


## Following example shows how to use terraform cidrsubnet function
## cidrsubnet(prefix, newbits, netnum)
## newbits is the number of additional bits with which to extend the prefix. For example, if given a prefix ending in /16 and a newbits value of 8, the resulting subnet address will have length /24
## netnum is a whole number that can be represented as a binary integer with no more than newbits binary digits, which will be used to populate the additional bits added to the prefix


# resource "aws_subnet" "subnet2" {
#   cidr_block = cidrsubnet(data.aws_vpc.vpc.cidr_block, 8, 10)

#   tags = {
#     Name = "my-tf-vpc-subnet2"
#   }

# # Refer to vpc ID
#   vpc_id     = data.aws_vpc.vpc.id
# }