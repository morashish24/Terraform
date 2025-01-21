resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "DemoVPCAmor"
  }
}

   resource "aws_security_group" "demo_sg" {
    name        = "demo-security-group"
    description = "Security group for example resources"
    vpc_id      = aws_vpc.main.id # Replace with your VPC ID

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from anywhere
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "example-sg"
    }
}

resource "aws_subnet" "subnet1"{
  vpc_id = aws_vpc.main.id 
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet2"{
  vpc_id = aws_vpc.main.id 
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "DemoIGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "DemoGW" 
  }
}

resource "aws_route_table" "demo_route_table" {
  
  vpc_id = aws_vpc.main.id 

  route { 

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DemoIGW.id

  }
}

resource "aws_route_table_association" "demo_rt_asssociation" {

  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.demo_route_table.id
}