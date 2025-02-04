Example 1 - Get instance Information by Tags

data "aws_instance" "my_instance" {
  instance_id = "i-0abcdef1234567890"
}

output "instance_public_ip" {
  value = data.aws_instance.my_instance.public_ip
}

Example -2 Get VPC by Name 

data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        value = ["my-vpc"]
    }
}

output "vpc_id" {
    value = data.aws_vpc.selected.id
}

Example 3 - Get Security Group by Name 

data "aws_security_group" "example" {
    filter {
        name = "group-name"
        value = ["my-security-group"]
    }
}

output "security_gorup_id" {
    value = data.aws_security_group.example.id
}

Example 4 - Get latest AMI 

data "aws_ami" "latest_amazon_linux" {
    most_recent = "true"
    owners = ["amazon"]

    filters {
        name = "name"
        values = ["amzn2-ami-hvm-*]
    }
}

output "ami_id" {
    value = data.aws_ami.latest_amazon_linux.id
}