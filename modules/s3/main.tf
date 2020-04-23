#creates s3 bucket with webhosting properties enabled
resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.bucket_name
  acl     = "private"

  tags = {
    Name        = "module-s3-taragurung"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"

    }
 }
