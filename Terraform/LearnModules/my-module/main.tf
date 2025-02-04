resource "aws_instance" "web" {
    instance_type = var.instance_type
    ami = var.ami_id 

}

output "instance_id" {
    value = aws_instance.web.id
}