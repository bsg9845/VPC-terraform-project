#vpc

resource "aws_vpc" "My-vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    name = "my_vpc"
  }
}

#subnets

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.My-vpc
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

#IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My-vpc

  tags = {
    Name = "MyInternetGateway"
  }
}

#routeTable

resource "aws_route_table" "myRT" {
  vpc_id = aws_vpc.My-vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


#RoutetableAssociation

resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)   
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.myRT.id
}


