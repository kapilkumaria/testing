variable "region" {
    default = "us-east-1"
}

variable "vpc-cidr" {
    default = "10.0.0.0/16"
}

variable "vpc-tag-name" {
    default = "projectvpc"
}

variable "vpc-tag-env" {
    default = "Dev"
}

variable "subnet-cidr-blocks" {
    default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
}

variable "igw-tag" {
    default = "projectigw"
}

variable "nat-tag" {
    default = "projectnat"
}

variable "myip" {
    default = "66.222.146.176/32"
}

/*
variable "ingressrulesweb" {
    type = list(object({
        from_port = number
        to_port = number
        protocol = string
        cidr_block = string
        description = string
    }))

    default = [
    {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_block = "66.222.146.176/32"
        description = "test"
    },
    {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_block = [aws_security_group.bastionsg.id]
        description = "test"
    },
    ]
}
*/  

variable "ec2-ami" {
    type = map

    default = {
        us-east-1 = "ami-02e136e904f3da870"
        us-east-2 = "ami-074cce78125f09d61"
        us-west-1 = "ami-03ab7423a204da002"
        us-west-2 = "ami-013a129d325529d4d"
    }
}

variable "instance-type" {
    default = "t2.micro"
}

variable "bastionaz" {
    default = "us-east-1a"
}

variable "env-bastion" {
    default = "dev"
}

variable "env-web" {
    default = "web"
}

variable "env-db" {
    default = "db"
}

variable "lb-name" {
    default = "my-alb"
}

variable "subnet1a_public" {
    default = "us-east-1a"
}

variable "subnet1b_public" {
    default = "us-east-1b"
}