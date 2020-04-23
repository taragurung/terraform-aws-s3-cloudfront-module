# Name of the bucket
output unique_bucket_name{
  value = aws_s3_bucket.tf-bucket.bucket_regional_domain_name
}
