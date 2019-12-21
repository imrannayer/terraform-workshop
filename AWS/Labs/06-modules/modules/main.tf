variable "name_prefix" {
  description = "Prefiix for neetwoork names"
}

resource "aws_vpc" "vpc_network" {
  cidr_block       = "10.10.0.0/16"

  tags = {
    Name = "${var.name_prefix}-my-tf-vpc-network"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "${var.name_prefix}-my-tf-vpc-subnet1"
  }

  vpc_id     = aws_vpc.vpc_network.id
}

output vpcnet {
  value = aws_vpc.vpc_network
}

output subnet1 {
  value = aws_subnet.subnet1
}