module "eks" {
    source = "terraform-aws-modules/eks/aws" 
    cluster_name = "TerraformDemoCluster"
    cluster_version = "1.27"

    subnet_ids = ["aws_subnet.subnet1.id"]


    vpc_id = "aws_vpc.main.id"

    eks_managed_node_groups = {

        nodoe_group = {
            min_sixw = 2
            max_sixe = 6
            desired_size = 2
        }
    }

    resource "aws_security_group" "demo_sg" {
    name        = "demo-security-group"
    description = "Security group for example resources"
    vpc_id      = "aws_vpc.main.id" # Replace with your VPC ID

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
}

