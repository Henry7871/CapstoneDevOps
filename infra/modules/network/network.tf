resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_subnet" "pub_sub" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.pub_sub_cidr_block
    availability_zone = var.az
    map_public_ip_on_launch = true

    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_subnet" "prv_sub" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.prv_sub_cidr_block
    availability_zone = var.az
    map_public_ip_on_launch = false

    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_route_table_association" "rt_assoc" {
    subnet_id = aws_subnet.pub_sub.id
    route_table_id = aws_route_table.pub_rt.id
}

resource "aws_eip" "nat_eip" {
    vpc = true
    
    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.pub_sub.id

    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_route_table" "prv_rt" {
    vpc_id = aws_vpc.main.id
    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id
    }

    tags = {
        Project = "sdn-tutorial"
    }
}

resource "aws_route_table_association" "prv_rt_assoc" {
    subnet_id = aws_subnet.prv_sub.id
    route_table_id = aws_route_table.prv_rt.id
}