
module tara_s3_module{
  source = "./modules/s3"
  bucket_name = var.bucket_name
}

locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {

  origin {
    
    domain_name = module.tara_s3_module.unique_bucket_name
    origin_id   = local.s3_origin_id # A unique identifier to origin

  }

  enabled             = true            # This is the flag to enable/disable distribution
  is_ipv6_enabled     = true            # 
  comment             = "Some comment"
  default_root_object = "index.html"    #its the root object to access when the request is made to ROOT url

#-----------------
#   LOGS Disabled 
#-----------------
# (optional) settings related to ,how will distribution write to logs
  # I will disable logs for now
#  logging_config {
#    include_cookies = false                      # to include cookies to access logs or not
#    bucket          = "mylogs.s3.amazonaws.com"  # bucket to put logs
#    prefix          = "myprefix"                 # prefix to add before the logs
#  }

# --------------------------
# Cache behavior arguments:
# --------------------------
  
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"] #By default this 2 methods gets cached,check console for clarification
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 0
    #max_ttl                = 86400
    max_ttl                = 0
  }

  #make it modular too
  price_class = "PriceClass_100"

  #---------------
  # GEO restrictions
  # required
  # --------------  
  restrictions {
    geo_restriction {
      # none, whitelist, blacklist
      restriction_type = "none"
      #locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    Environment = "Dev"
  }
  
  # We can use default cloudfront certificates or fetch it from ACM,
  # default fine now 
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

