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

