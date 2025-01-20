module "eks" {
    source = "terraform-aws-modules/eks/aws" 
    cluster_name = "TerraformDemoCluster"
    cluster_version = "1.27"

    subnet_ids = aws_subnet.subnet1.id

    vpc_id = aws_vpc.main.id


}