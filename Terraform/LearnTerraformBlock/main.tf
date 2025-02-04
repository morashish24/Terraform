terraform {
    required_providers = "aws"
    version = "~>3.4"
    backend {
        s3 
    }
    dynammo_db = 
    profile = "default"   # Its optional. Profile is written to choose the aws credentials which need to be used stored in .aws/credentials file
}

provider "aws" {
    version = 
    region = "us-east-1"
    profile = "default"
}

resources "ec2_instance" "my_ec2_instance" {
    type = "t2.micro"
    image = ""
  
}

resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = "my-unique-s3-bucket"
    acl    = "private"
}

output "bucket_name" {
    value = "aws_s3_bucket.my-aws_s3_bucket.bucket"

}