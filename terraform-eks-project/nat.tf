resource "aws_eip" "toys_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "toys_nat_eip"
  }
}

resource "aws_nat_gateway" "toys_nat_gateway" {
  allocation_id = aws_eip.toys_nat_eip.id
  subnet_id     = aws_subnet.toys_public_subnet[0].id

  tags = {
    Name = "toys_nat_gateway"
  }

  depends_on = [aws_internet_gateway.toys_igw]
}

resource "aws_route_table" "toys_public_route_table" {
  vpc_id = aws_vpc.toys_vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.toys_igw.id
  }

  tags = {
    Name = "toys_public_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(aws_subnet.toys_public_subnet)

  subnet_id      = aws_subnet.toys_public_subnet[count.index].id
  route_table_id = aws_route_table.toys_public_route_table.id
}

resource "aws_route_table" "toys_private_route_table" {
  vpc_id = aws_vpc.toys_vpc_main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.toys_nat_gateway.id
  }

  tags = {
    Name = "toys_private_route_table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count = length(aws_subnet.toys_private_subnet)

  subnet_id      = aws_subnet.toys_private_subnet[count.index].id
  route_table_id = aws_route_table.toys_private_route_table.id
}