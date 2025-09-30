resource "aws_vpc" "todo_app_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "todo_app_vpc"
  }
}

resource "aws_subnet" "todo_app_subnet" {
  vpc_id            = aws_vpc.todo_app_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "todo_app_subnet"
  }
}

resource "aws_internet_gateway" "todo_app_igw" {
  vpc_id = aws_vpc.todo_app_vpc.id

  tags = {
    Name = "todo_app_igw"
  }
}

resource "aws_route_table" "todo_app_route_table" {
  vpc_id = aws_vpc.todo_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.todo_app_igw.id
  }

  tags = {
    Name = "todo_app_route_table"
  }
}

resource "aws_route_table_association" "todo_app_subnet_association" {
  subnet_id      = aws_subnet.todo_app_subnet.id
  route_table_id = aws_route_table.todo_app_route_table.id
}