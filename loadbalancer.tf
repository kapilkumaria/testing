resource "aws_lb" "alb" {
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
    
    enable_deletion_protection = true

    
}