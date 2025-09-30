resource "aws_instance" "todo_app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TodoAppInstance"
  }
}

output "instance_id" {
  value = aws_instance.todo_app_instance.id
}

output "instance_public_ip" {
  value = aws_instance.todo_app_instance.public_ip
}