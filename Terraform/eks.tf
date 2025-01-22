module "eks" {
    source = "terraform-aws-modules/eks/aws" 
    cluster_name = "TerraformDemoCluster"
    cluster_version = "1.27"

    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]


    vpc_id = aws_vpc.main.id

    ami_type       = "AL2_x86_64"
    instance_types = ["m6i.large"]

    eks_managed_node_groups = {

        nodoe_group = {
            min_sixw = 2
            max_sixe = 6
            desired_size = 2
        }
    }
}

