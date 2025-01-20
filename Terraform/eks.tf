module {
    source = "terraform-aws-modules/eks/aws" 
    cluster_name = "TerraformDemoCluster"
    cluster_version = "1.27"
}