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
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2"{
  vpc_id = aws_vpc.main.id 
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
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

# EKS Node Group Role
resource "aws_iam_role" "eks_node_role" {
  name = "demo-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_container_registry_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_role.name
}