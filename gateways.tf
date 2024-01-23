resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.lab-vpc1.id

  tags = {
    Name = "IGW"
  }
}



resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT_GW"
  }
  depends_on = [aws_internet_gateway.IGW]
}