1. Basic Syntax 

resources "ec2_instance" "example" {
    count = 3 
    ami = "ami-123456"
    instance_type = "t2.micro"
}

This will create 3 identical instances 

2. 
