terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}
provider "aws" {
  region = var.region
}

resource "aws_vpc" "alex_vpc_v3" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "alex_subnet_v3" {
  vpc_id            = aws_vpc.alex_vpc_v3.id
  cidr_block        = var.subnet_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "alex_igw_v3" {
  vpc_id = aws_vpc.alex_vpc_v3.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "alex_route_table_v3" {
  vpc_id = aws_vpc.alex_vpc_v3.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alex_igw_v3.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "alex_route_table_association_v3" {
  subnet_id      = aws_subnet.alex_subnet_v3.id
  route_table_id = aws_route_table.alex_route_table_v3.id
}



resource "aws_security_group" "alex_sg_v3" {
  name        = var.security_group_name
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.alex_vpc_v3.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "alex_instance_v3" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.alex_subnet_v3.id
  vpc_security_group_ids = [aws_security_group.alex_sg_v3.id]
  tags = {
    Name = var.instance_name
  }
}



