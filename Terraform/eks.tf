module "eks" {
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
}

