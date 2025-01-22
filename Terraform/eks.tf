/*module "eks" {
    source = "terraform-aws-modules/eks/aws" 
    cluster_name = "TerraformDemoCluster"
    cluster_version = "1.27"

    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]


    vpc_id = aws_vpc.main.id

    

    eks_managed_node_groups = {

        node_group = {
            ami_type       = "AL2_x86_64"
            instance_types = ["m6i.large"]
            min_size = 2
            max_size = 6
            desired_size = 2
             
        }

        
    }
}*/


# EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "DemoEksCluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    module.vpc
  ]

  tags = {
    Environment = var.environment
  }
}

# EKS Node Group
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "demo-node-group"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = module.vpc.private_subnets

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = var.node_instance_types

  depends_on = [
    aws_iam_role_policy_attachment.node_group_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_group_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_group_AmazonEC2ContainerRegistryReadOnly
  ]

  tags = {
    Environment = var.environment
  }
}