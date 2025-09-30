resource "aws_s3_bucket" "todo_app_bucket" {
  bucket = var.bucket_name
  # acl    = var.acl  # Removed due to deprecation; manage permissions via bucket policy or aws_s3_bucket_acl resource if needed

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }

}

resource "aws_s3_bucket_policy" "todo_app_bucket_policy" {
  bucket = aws_s3_bucket.todo_app_bucket.id
  policy = data.aws_iam_policy_document.todo_app_bucket_policy.json
}

data "aws_iam_policy_document" "todo_app_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
  }
}

resource "aws_s3_bucket_versioning" "todo_app_bucket_versioning" {
  bucket = aws_s3_bucket.todo_app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

data "aws_iam_policy_document" "todo_app_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.todo_app_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = var.allowed_principal_arns
    }
  }
}