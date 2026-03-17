resource "aws_vpc" "toys_vpc_main" {
  cidr_block           = var.toys_vpc_cidir
  instance_tenancy     = var.toys_vpc_instance_tenancy
  enable_dns_hostnames = true

  tags = {
    Name = var.toys_vpc
  }
}

resource "aws_internet_gateway" "toys_igw" {
  vpc_id = aws_vpc.toys_vpc_main.id

  tags = {
    Name = "toys_internet_gateway"
  }
}