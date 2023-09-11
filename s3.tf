provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "your-unique-bucket-name"  # Replace with your desired bucket name
  acl    = "private"  # You can customize the ACL (Access Control List) as needed
}
