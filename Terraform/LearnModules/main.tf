module "web-server" {
    source = "./my-module"
    ami_id = 
    instance_type = 
}

# How to use remote module 

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  cidr    = "10.0.0.0/16"
}

# How to use module from a git repository 

module "web_server" {
  source = "git::https://github.com/user/my-terraform-module.git?ref=v1.0"
}