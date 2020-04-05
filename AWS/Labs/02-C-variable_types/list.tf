variable "x_vpc_cidr_list" {
  description = "Name of VPC network"
  default = ["10.10.0.0/16", "10.200.0.0/16", "10.12.0.0/16",]
}

resource "aws_vpc" "vpc_list" {
  cidr_block  = element(var.x_vpc_cidr_list, 0)

  tags = {
    Name      = "vpc_list"
  }
}