data "aws_availability_zones" "availability_zones" {
  state = "available"
  
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = var.tags

}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true
  tags              = var.tags
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags

}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route = {
    cidr_block = "0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags   = var.tags
  
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
  
}