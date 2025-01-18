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

