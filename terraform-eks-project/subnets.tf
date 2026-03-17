resource "aws_subnet" "toys_public_subnet" {
  count = length(var.toys_vpc_public_cidir)

  vpc_id                  = aws_vpc.toys_vpc_main.id
  cidr_block              = var.toys_vpc_public_cidir[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "toys-public-subnet-${count.index}"

    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/prod-eks-cluster" = "shared"
  }
}

resource "aws_subnet" "toys_private_subnet" {
  count = length(var.toys_vpc_private_cidir)

  vpc_id            = aws_vpc.toys_vpc_main.id
  cidr_block        = var.toys_vpc_private_cidir[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "toys-private-subnet-${count.index}"

    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/prod-eks-cluster" = "shared"
  }
}