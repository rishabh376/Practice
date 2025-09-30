resource "aws_vpc" "todoapp_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "todoapp_vpc"
  }
}

resource "aws_subnet" "todoapp_subnet" {
  vpc_id            = aws_vpc.todoapp_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "todoapp_subnet"
  }
}

resource "aws_security_group" "todoapp_sg" {
  vpc_id = aws_vpc.todoapp_vpc.id

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

  tags = {
    Name = "todoapp_sg"
  }
}

resource "aws_instance" "todoapp_instance" {
  ami           = var.ami_id
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

  tags = {
    Name = "todoapp_db"
  }
}

output "instance_public_ip" {
  value = aws_instance.todoapp_instance.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.todoapp_db.endpoint
}