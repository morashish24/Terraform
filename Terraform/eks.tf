module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.29.0" # Use the latest stable version
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  node_group_defaults = {
    ami_type        = "AL2_x86_64"
    disk_size       = 20
    instance_types  = ["t3.medium"]
  }

  managed_node_groups = {
    eks_nodes = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      key_name = "your-key-pair-name" # Replace with your EC2 key pair
    }
  }

  tags = {
    Environment = "dev"
    Team        = "devops"
  }
}