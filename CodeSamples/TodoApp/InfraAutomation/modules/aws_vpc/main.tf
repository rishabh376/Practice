resource "aws_vpc" "todoapp_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "todoapp-vpc"
  }
}

resource "aws_subnet" "todoapp_subnet" {
  vpc_id            = aws_vpc.todoapp_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "todoapp-subnet"
  }
}

resource "aws_internet_gateway" "todoapp_igw" {
  vpc_id = aws_vpc.todoapp_vpc.id
  tags = {
    Name = "todoapp-igw"
  }
}

resource "aws_route_table" "todoapp_route_table" {
  vpc_id = aws_vpc.todoapp_vpc.id
  tags = {
    Name = "todoapp-route-table"
  }
}

resource "aws_route" "todoapp_route" {
  route_table_id         = aws_route_table.todoapp_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.todoapp_igw.id
}

resource "aws_route_table_association" "todoapp_subnet_association" {
  subnet_id      = aws_subnet.todoapp_subnet.id
  route_table_id = aws_route_table.todoapp_route_table.id
}