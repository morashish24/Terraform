variable "ami_id" {
    description = "AMI id for the instance"
    type = string
    default  = ""
} 

variable "instance_type" {
    description = "Instance type for the instnace"
    type = string 
    default = "t2.micro"
}

