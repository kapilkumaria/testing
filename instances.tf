resource "aws_instance" "bastionec2" {
    count = var.env == "dev" ? 1 : 0
    ami = lookup(var.ec2-ami,var.region)
    instance_type = var.instance-type
    associate_public_ip_address = "true"
    subnet_id = aws_subnet.subnets.count.index
    #availability_zone = var.bastionaz
    security_groups = [aws_security_group.bastionsg.name]
}