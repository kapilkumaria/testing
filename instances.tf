resource "aws_instance" "bastionec2" {
    count = var.env-bastion == "dev" ? 1 : 0

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

resource "aws_instance" "webserver1" {
    #count = var.env-web == "web" ? 1 : 0

    ami = lookup(var.ec2-ami,var.region)
    instance_type = var.instance-type
    associate_public_ip_address = "true"
    #subnet_id = "aws_subnet.subnets[count.index].[0]"
    subnet_id = data.aws_subnet.pub-subnet1.id
    security_groups = [aws_security_group.websg.id]

    tags = {
        Name = "web server - 1"
    }
}    

resource "aws_instance" "webserver2" {
    #count = var.env-web == "web" ? 1 : 0

    ami = lookup(var.ec2-ami,var.region)
    instance_type = var.instance-type
    associate_public_ip_address = "true"
    #subnet_id = "aws_subnet.subnets[count.index].[0]"
    subnet_id = data.aws_subnet.pub-subnet2.id
    security_groups = [aws_security_group.websg.id]

    tags = {
        Name = "web server - 2"
    }
}    

resource "aws_instance" "dbserver1" {
    count = var.env-db == "db" ? 1 : 0

    ami = lookup(var.ec2-ami,var.region)
    instance_type = var.instance-type
    associate_public_ip_address = "true"
    #subnet_id = "aws_subnet.subnets[count.index].[0]"
    subnet_id = data.aws_subnet.pub-subnet1.id
    security_groups = [aws_security_group.dbsg.id]

    tags = {
        Name = "database server"
    }
}    

