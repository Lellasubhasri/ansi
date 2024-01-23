resource "aws_route_table" "internet_route_table" {
  vpc_id = aws_vpc.lab-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.lab-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT_GW.id

  }

  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_route_table_association" "Public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_route_table.id
}


resource "aws_route_table_association" "Private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.nat_route_table.id
}