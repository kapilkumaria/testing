resource "aws_security_group" "bastionsg" {
    name = "bastionsg"
    description = "Allow SSh Connection only from my computer"
    vpc_id = aws_vpc.projectvpc.id
    
    ingress = [
        {
          description = "SSH from myIP"
          from_port = 22
          to_port = 22
          protocol = "tcp"
          cidr_blocks = [var.myip]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
          self = false      
        }
    ]
 
    egress = [
        {
            description = "for all outgoing traffic"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    tags = {
        Name = "bastion-sg"
    }
}

resource "aws_security_group" "websg" {
    #count = length(var.ingressrulesweb)

    name = "websg"
    description = "Allow HTTP Traffic from ALB"
    vpc_id = aws_vpc.projectvpc.id

    /*dynamic "ingress" {
        for_each = var.ingressrulesweb

        content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        #cidr_blocks = [ingress.value.cidr_block]
        } 
    } 
*/
  
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        security_groups = [aws_security_group.bastionsg.id]
        description = "test"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups = [aws_security_group.albsg.id]
        description = "test"
    } 

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "TCP"
        security_groups = [aws_security_group.albsg.id]
        description = "test"
    } 
    
    egress {
        description = "for all outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        prefix_list_ids = []
        security_groups = []
        self = false
    }
    
    tags = {
        Name = "web-sg"
    }
}


/*resource "aws_security_group_rule" "websgrule" {
    type = "ingress"
    #security_group_id = aws_security_group.websg[count.index]
    security_group_id = [data.aws_security_groups.bastionsg]
    from_port = 80
    to_port = 80
    protocol = "tcp"
    #source_security_group_id = [aws_security_group.bastionsg.id]
    depends_on = [
        aws_security_group.bastionsg
    ]
       
}*/

resource "aws_security_group" "albsg" {
    name = "albsg"
    description = "Allow HTTP traffic from everywhere"
    vpc_id = aws_vpc.projectvpc.id
    
    ingress = [
        {
          description = "HTTP from everywhere"
          from_port = 80
          to_port = 80
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
          self = false      
        }
    ]
 
    egress = [
        {
            description = "for all outgoing traffic"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    tags = {
        Name = "alb-sg"
    }
}

resource "aws_security_group" "dbsg" {
    #count = length(var.ingressrulesweb)

    name = "dbsg"
    description = "Allow HTTP Traffic from WebServer"
    vpc_id = aws_vpc.projectvpc.id
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        security_groups = [aws_security_group.bastionsg.id]
        description = "test"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups = [aws_security_group.websg.id]
        description = "test"
    } 
    
    egress {
        description = "for all outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        prefix_list_ids = []
        security_groups = []
        self = false
    }
    
    tags = {
        Name = "db-sg"
    }
}