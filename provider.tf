terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = false
  enable_dns_hostnames = false
}


variable "vpc_availability_zones" {
  type = list (string)
  description = "Availability Zones"
  default = ["us-east-1a", "us-east-1b"]
}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  count = length(var.vpc_availability_zones)
  cidr_block = cidersubnet(aws_vpc.custom_vpc.cidr_block, 8, count.index+1)
  }

  



