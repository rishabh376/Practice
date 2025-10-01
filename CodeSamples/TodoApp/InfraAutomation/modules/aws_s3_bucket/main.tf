resource "aws_s3_bucket" "todo_app_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "TodoAppBucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "todo_app_bucket_versioning" {
  bucket = aws_s3_bucket.todo_app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "todo_app_bucket_policy" {
  bucket = aws_s3_bucket.todo_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.todo_app_bucket.arn}/*"
      }
    ]
  })
}