terraform {
    required_providers = "aws"
    version = "~>3.4"
    backend {
        s3 
    }
    dynammo_db = 

}

providers {
    version = 
    region = "us-east-1"
}

resources "ec2_instance" "my_ec2_instance" {
    type = "t2.micro"
    image = ""
  
}