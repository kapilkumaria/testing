#################################### Creating VPC ############################

resource "aws_vpc" "projectvpc" {
    cidr_block = var.vpc-cidr
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags = {
        Name = var.vpc-tag-name
        Environment = var.vpc-tag-env
    } 
}

#################################### Creating Subnets ############################

resource "aws_subnet" "subnets" {
    count = length(data.aws_availability_zones.azs.names)
    vpc_id = aws_vpc.projectvpc.id
    cidr_block = element(var.subnet-cidr-blocks,count.index)
    availability_zone = element(data.aws_availability_zones.azs.names,count.index)

    tags = {
        Name = "Subnet ${count.index+1}"
    }
}

#################################### Creating Internet Gateway ############################

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.projectvpc.id

    tags = {
        Name = var.igw-tag
    }
}

#################################### Creating Public Route Table ############################

resource "aws_route_table" "rta-pub" {
    vpc_id = aws_vpc.projectvpc.id

    tags = {
        Name = "pub-rt"
    }
}

resource "aws_route_table_association" "a" {
    subnet_id = data.aws_subnet.pub-subnet1.id
    route_table_id = aws_route_table.rta-pub.id
}

resource "aws_route_table_association" "b" {
    subnet_id = data.aws_subnet.pub-subnet2.id
    route_table_id = aws_route_table.rta-pub.id
}

resource "aws_route_table_association" "c" {
    subnet_id = data.aws_subnet.pub-subnet3.id
    route_table_id = aws_route_table.rta-pub.id
}

resource "aws_route" "pub-route1" {
    route_table_id = aws_route_table.rta-pub.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

#################################### Creating NAT Gateway ############################

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = data.aws_subnet.pub-subnet1.id

    tags = {
        Name = var.nat-tag
    }
}

#################################### Creating Private Route Table ############################

resource "aws_route_table" "rta-pri" {
    vpc_id = aws_vpc.projectvpc.id

    tags = {
        Name = "pri-rt"
    }
}

resource "aws_route_table_association" "d" {
    subnet_id = data.aws_subnet.pub-subnet4.id
    route_table_id = aws_route_table.rta-pri.id
}

resource "aws_route_table_association" "e" {
    subnet_id = data.aws_subnet.pub-subnet5.id
    route_table_id = aws_route_table.rta-pri.id
}

resource "aws_route_table_association" "f" {
    subnet_id = data.aws_subnet.pub-subnet6.id
    route_table_id = aws_route_table.rta-pri.id
}

resource "aws_route" "pri-route1" {
    route_table_id = aws_route_table.rta-pri.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
}

#################################### End #######################################################