# Terraform

Creating VPC and EKS cluster


resource "internet_gateway" "DemoIGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "DemoGW" 
  }
}