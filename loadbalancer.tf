resource "aws_lb" "myalb" {
    name = var.lb-name
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.albsg.id]
    
    subnet_mapping {
        #count = data.aws_availability_zones.id
        #subnet_id = "data.aws_availability_zones.azs"
        subnet_id = aws_subnet.subnets[0].id
    } 

    subnet_mapping {
        #count = data.aws_availability_zones.id
        #subnet_id = "data.aws_availability_zones.azs"
        subnet_id = aws_subnet.subnets[1].id

    } 
    
    #enable_deletion_protection = true
}

#======================================================================================================

resource "aws_lb_target_group" "mytg-images" {
    health_check {
        interval = 10
        path = "/images/image1"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 2 
    }
        name     = "tf-images"
        port     = 80
        protocol = "HTTP"
        vpc_id   = aws_vpc.projectvpc.id

        tags = {
            Name = var.tf-images
        }
}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn 
  port = 80
  protocol = "HTTP"

  default_action {
     target_group_arn = aws_lb_target_group.mytg-images.arn
     type = "forward"
  }
}

resource "aws_lb_listener_rule" "images" {
    listener_arn = aws_lb_listener.listener.arn
    priority = 100

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.mytg-images.arn
    }

    condition {
        path_pattern {
            values = ["/images/*"]
        }
    }
}

resource "aws_alb_target_group_attachment" "ec2_web1_attach" {
    target_group_arn = aws_lb_target_group.mytg-images.arn
    target_id = aws_instance.webserver1.id
    #port = 3000
}

#======================================================================================================

resource "aws_lb_target_group" "mytg-logfiles" {
    health_check {
        interval = 10
        path = "/logfiles/log1"
        protocol = "HTTP"
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 2 
    }
        name     = "tg-logfiles"
        port     = 80
        protocol = "HTTP"
        vpc_id   = aws_vpc.projectvpc.id

        tags = {
            Name = var.tf-logfiles
        }
}


/*resource "aws_lb_listener" "logfiles-listener" {
  load_balancer_arn = aws_lb.myalb.arn 
  port = 80
  protocol = "HTTP"

  default_action {
     target_group_arn = aws_lb_target_group.mytg-logfiles.arn
     type = "forward"
  }
}
*/

resource "aws_lb_listener_rule" "logfiles" {
    listener_arn = aws_lb_listener.listener.arn
    priority = 200

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.mytg-logfiles.arn
    }

    condition {
        path_pattern {
            values = ["/logfiles/*"]
        }
    }
}

resource "aws_alb_target_group_attachment" "ec2_web2_attach" {
    target_group_arn = aws_lb_target_group.mytg-logfiles.arn
    target_id = aws_instance.webserver2.id
    #port = 3000
}
