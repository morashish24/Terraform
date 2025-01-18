resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "DemoVPCAmor"
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
  
  vpc_id = aws_vpc_main.id 

  route { 

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DemoIGW.id

  }
}