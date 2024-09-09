provider "aws" {
  # Configuration options
region = var.region
}
resource "aws_vpc" "My_vpc" {
     cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  }
  resource "aws_internet_gateway" "My_internet" {
    vpc_id = aws_vpc.My_vpc.id
    
  }
  resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.My_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true   
    availability_zone = "us-east-1a"
  }
  resource "aws_subnet" "privte_subnet" {
    vpc_id = aws_vpc.My_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    
  }
  resource "aws_route_table" "Tabes" {
    vpc_id = aws_vpc.My_vpc.id
    route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My_internet.id
  }
    
  }
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.My_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
  