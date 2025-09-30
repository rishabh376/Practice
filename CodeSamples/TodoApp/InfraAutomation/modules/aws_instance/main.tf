resource "aws_instance" "todo_app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TodoAppInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ubuntu
              git clone https://github.com/your-repo/TodoApp.git
              cd TodoApp/PyTodoBackendMonolith
              pip install -r requirements.txt
              nohup python app.py &
              EOF
}

output "instance_id" {
  value = aws_instance.todo_app_instance.id
}

output "instance_public_ip" {
  value = aws_instance.todo_app_instance.public_ip
}