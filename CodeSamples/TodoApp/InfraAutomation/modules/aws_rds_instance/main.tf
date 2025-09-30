resource "aws_db_instance" "todo_app_db" {
  allocated_storage    = var.allocated_storage
  storage_type       = var.storage_type
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  db_name            = var.db_name
  username           = var.username
  password           = var.password
  db_subnet_group_name = aws_db_subnet_group.todo_app_subnet_group.name
  vpc_security_group_ids = [aws_security_group.todo_app_sg.id]
  multi_az           = var.multi_az
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot = true

  tags = {
    Name = "TodoAppDB"
  }
}

resource "aws_db_subnet_group" "todo_app_subnet_group" {
  name       = "todo-app-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "TodoAppSubnetGroup"
  }
}

resource "aws_security_group" "todo_app_sg" {
  name        = "todo-app-sg"
  description = "Allow access to the Todo App RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TodoAppSecurityGroup"
  }
}