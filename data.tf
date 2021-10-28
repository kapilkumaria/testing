data "aws_availability_zones" "azs" {}

data "aws_subnet" "pub-subnet1" {
    filter {
        name = "tag:Name"
        values = ["Subnet 1"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnet2" {
    filter {
        name = "tag:Name"
        values = ["Subnet 2"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnet3" {
    filter {
        name = "tag:Name"
        values = ["Subnet 3"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnet4" {
    filter {
        name = "tag:Name"
        values = ["Subnet 4"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnet5" {
    filter {
        name = "tag:Name"
        values = ["Subnet 5"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnet6" {
    filter {
        name = "tag:Name"
        values = ["Subnet 6"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

data "aws_subnet" "pub-subnets" {
    filter {
        name = "tag:Name"
        values = ["Subnet 1"]
    }

    depends_on = [
        aws_subnet.subnets
    ]
}

/*data "aws_security_groups" "bastionsg" {
    filter {
        name = "tag:Name"
        values = ["Allow HTTP Traffic from everywhere"]
    }

    depends_on = [
        aws_security_group.bastionsg
    ]
}*/