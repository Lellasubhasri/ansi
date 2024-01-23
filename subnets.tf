resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab-vpc1.id
  cidr_block = var.cidr_public

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.lab-vpc1.id
  cidr_block = var.cidr_private

  tags = {
    Name = "Private"
  }
}