resource "aws_instance" "bastionec2" {
    #count = var.env == "dev" ? 1 : 0
    ami = lookup(var.ec2-ami,var.region)
    instance_type = var.instance-type
    associate_public_ip_address = "true"
    #subnet_id = "aws_subnet.subnets[count.index].[0]"
    subnet_id = data.aws_subnet.pub-subnet1.id
    security_groups = [aws_security_group.bastionsg.id]

    tags = {
        Name = "bastion server"
    }
}