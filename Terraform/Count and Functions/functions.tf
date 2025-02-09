1. 

resource "ec2_instance" "example" {
    count = 3 
    ami = ami-123456
    type = "t2.micro"

}

2. 

resource "ec2_instance" "example" {
    count = 3 
    ami = ami-123456
    type = "t2.mircro"

    tags = {
        name = "Instance- ${count.index}

    }
}

3. 

resource "ec2_instance" "example" {
    count = var.create_instance ? 1 : 0
    ami = ami-123456
    instance_type = "t2.micro" 
}

4. Using count with variables 

variable "number_of_instances" {
    default = 3
}

resource "aws_instance" "example" {
    count = var.number_of_instances
    ami = ami-12456
    instance_type = "t2.micro"
}

 
5. Using count with list 

variale "instance_names" {
    default = [ "web-1","web-2", "web-3"]
}

resuorce "aws_instance" "example" { 
    count = legnth 
} 
 6. LookUp function 

variable "env_setting" {
    default = {
        dev = "t2.micro"
        prod = "t2.large" 
    }
}

output "instance_type" {
   value = lookup (var.env_setting, "prod", "t2.medium")
}

the out put will be t2.large since the prd key exist.  




