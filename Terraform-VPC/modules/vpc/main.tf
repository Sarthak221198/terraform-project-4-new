resource "aws_vpc" "vpc"{
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}


#2 Public Subnets
resource "aws_subnet" "public_subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name = var.subnet_names[count.index]
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = "public-rt"
  }
}

# 1 route table association with 2 subnets
resource "aws_route_table_association" "public_subnets_associaiton" {
  count = length(var.subnet_cidr)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public-rt.id
} 
