provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "todoapp_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "todoapp_vpc"
  }
}

resource "aws_subnet" "todoapp_subnet" {
  vpc_id            = aws_vpc.todoapp_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "todoapp_subnet"
  }
}

resource "aws_internet_gateway" "todoapp_igw" {
  vpc_id = aws_vpc.todoapp_vpc.id
  tags = {
    Name = "todoapp_igw"
  }
}

resource "aws_route_table" "todoapp_route_table" {
  vpc_id = aws_vpc.todoapp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.todoapp_igw.id
  }

  tags = {
    Name = "todoapp_route_table"
  }
}

resource "aws_route_table_association" "todoapp_route_table_association" {
  subnet_id      = aws_subnet.todoapp_subnet.id
  route_table_id = aws_route_table.todoapp_route_table.id
}

resource "aws_security_group" "todoapp_sg" {
  vpc_id = aws_vpc.todoapp_vpc.id
  name   = "todoapp_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = "todoapp_sg"
  }
}

resource "aws_instance" "todoapp_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.todoapp_subnet.id
  security_groups = [aws_security_group.todoapp_sg.name]

  tags = {
    Name = "todoapp_instance"
  }
}

resource "aws_db_instance" "todoapp_db" {
  identifier         = "todoapp-db"
  engine             = "mysql"
  instance_class     = "db.t2.micro"
  allocated_storage   = 20
  username           = var.db_username
  password           = var.db_password
  db_name            = var.db_name
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.todoapp_sg.id]

  tags = {
    Name = "todoapp_db"
  }
}