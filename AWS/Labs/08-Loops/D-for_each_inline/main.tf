provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key" 
}


resource "aws_vpc" "vpc_network" {
  cidr_block       = "10.10.0.0/16"
  tags = {
    Name = "my-tf-vpc-network"
  }
}


######### Without dynamic nested block


resource "aws_network_acl" "my_nacl" {
  vpc_id = aws_vpc.vpc_network.id

  ingress {
    rule_no    = 100
    cidr_block = "40.71.37.173/32"
    protocol   = -1
    action     = "allow"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    rule_no    = 200
    cidr_block = "40.71.37.174/32"
    protocol   = -1
    action     = "allow"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 300
    cidr_block = "40.71.37.175/32"
    protocol   = -1
    action     = "allow"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "my-tf-vpc-nacl-simple"
  }
}



#######       Dynamic nested inline block 



############  Example with Map

variable "inbound_ip_map" {
  description = "Inbound IP addresses"
  type        = map(string)
  default     = {
    100 = "40.71.37.173/32"
    200 = "40.71.37.174/32"
    300 = "40.71.37.175/32"
  }
}

resource "aws_network_acl" "my_nacl_map" {
  vpc_id = aws_vpc.vpc_network.id

  dynamic "ingress" {
    for_each = var.inbound_ip_map
    content {
      # keys and values from map
      rule_no    = ingress.key
      cidr_block = ingress.value
      # hard coded values
      protocol   = -1
      action     = "allow"
      from_port  = 0
      to_port    = 0
    }
  }



  tags = {
    Name = "my-tf-vpc-nacl-map"
  }
}





############Example with List

variable "inbound_ip_list" {
  description = "Inbound IP addresses"
  type        = list(string)
  default     = ["40.71.37.174/32", "40.71.37.175/32", "40.71.37.176/32"]
}

resource "aws_network_acl" "my_nacl_list" {
  vpc_id = aws_vpc.vpc_network.id

  dynamic "ingress" {
    for_each = var.inbound_ip_list
    content {
      # keys and values from map
      rule_no    = ingress.key + 100
      cidr_block = ingress.value
      # hard coded values
      protocol   = -1
      action     = "allow"
      from_port  = 0
      to_port    = 0
    }
  }



  tags = {
    Name = "my-tf-vpc-nacl-list"
  }
}