terraform {

  backend "s3" {
    bucket         = "my-terraform-state-bucket-amor" # Replace with your bucket name
    key            = "terraform/state/terraform.tfstate" # Path to store the state file
    region         = "us-east-1" # Update the region as needed
    encrypt        = true
  }
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

variable "vpc_availability_zones" {
  type = list (string)
  description = "Availability Zoneds"
  default = ["us-east-1a", "us-east-1b"]
}






  
  

  



