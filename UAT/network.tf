resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Project = var.tag
  }
}

# Public subnet
resource "aws_subnet" "pub_sub" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true  # make the subnet become public when initialize

  tags = {
    Project = var.tag
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Project = var.tag
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Project = var.tag
  }
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_rt.id
}
