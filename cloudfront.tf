#This is for the dev team
provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_cloudfront_distribution" "example_distribution" {
  origin {
    domain_name = "example.com"  # Replace with your origin server or S3 bucket domain name
    origin_id   = "example-origin"
  }

  enabled = true

  default_cache_behavior {
    target_origin_id = aws_cloudfront_distribution.example_distribution.origin[0].origin_id
    viewer_protocol_policy = "redirect-to-https"
    
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
