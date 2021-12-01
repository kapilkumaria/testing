#################### EC2 Servers ##############################

output "ec2-bastion-id" {
    value = aws_instance.bastionec2.id
}

output "ec2-webserver1-id" {
    value = aws_instance.webserver1.id
}

output "ec2-webserver2-id" {
    value = aws_instance.webserver2.id
}

output "ec2-dbserver1-id" {
    value = aws_instance.dbserver1.id
}

output "ec2-dbserver2-id" {
    value = aws_instance.dbserver2.id
}

#################### EIP ##############################

output "eip-id" {
    value = aws_eip.eip.id
}

output "eip-tags" {
    value = aws_eip.eip.tags
}

#################### Security Groups ##############################

output "alb-sg" {
    value = aws_security_group.albsg.id
}

output "web-sg" {
    value = aws_security_group.websg.id 
}

output "db-sg" {
    value = aws_security_group.dbsg.id
}

output "bastion-sg" {
    value = aws_security_group.bastionsg.id
}

# ===================== VPC OUTPUTS =========================================== 
output "vpc-id" {
    value = aws_vpc.projectvpc.id
}

output "vpc-cidr" {
    value = aws_vpc.projectvpc.cidr_block
}

output "vpc-tag" {
    value = aws_vpc.projectvpc.tags
}

output "vpc-default-rt-id" {
value = aws_vpc.projectvpc.default_route_table_id
}

# ===================== SUBNETS OUTPUTS ===========================================

output "subnets-id" {
    value = aws_subnet.subnets.*.id
}

# ===================== IGW OUTPUTS ===========================================

output "IGW-IDs" {
    value = aws_internet_gateway.igw.id
}

output "IGW-ARN" {
    value = aws_internet_gateway.igw.arn
}

output "IGW-TAGS" {
    value = aws_internet_gateway.igw.tags_all
}

# ===================== NAT OUTPUTS ===========================================

output "NAT-IDs" {
    value = aws_nat_gateway.nat.id
}

output "NAT-ALLOCATION-ID" {
    value = aws_nat_gateway.nat.connectivity_type
}

output "NAT-SUBNET-ID" {
    value = aws_nat_gateway.nat.subnet_id
}

output "NAT-TAGS" {
    value = aws_nat_gateway.nat.tags
}

output "NAT-PUBLIC_IP" {
    value = aws_nat_gateway.nat.public_ip
}

output "NAT-PRIVATE_IP" {
    value = aws_nat_gateway.nat.private_ip
}

# ===================== PUBLIC ROUTE TABLE OUTPUTS ===========================================

output "ROUTE-TABLE-PUB-ID" {
    value = aws_route_table.rta-pub.vpc_id
}

output "ROUTE-TABLE-PUB-ROUTE" {
    value = aws_route_table.rta-pub.route
}

output "ROUTE-TABLE-PUB-TAGS" {
    value = aws_route_table.rta-pub.tags
}

# ===================== PRIVATE ROUTE TABLE OUTPUTS ===========================================

output "ROUTE-TABLE-PRI-ID" {
    value = aws_route_table.rta-pri.vpc_id
}

output "ROUTE-TABLE-PRI-ROUTE" {
    value = aws_route_table.rta-pri.route
}

output "ROUTE-TABLE-PRI-TAGS" {
    value = aws_route_table.rta-pri.tags
}

# ===================== END ===========================================
