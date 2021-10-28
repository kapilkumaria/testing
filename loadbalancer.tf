resource "aws_lb" "alb" {
    name = var.lb-name
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.albsg.id]
    subnets = [data.aws_subnet.pub-subnets.id]

    enable_deletion_protection = true

    
}