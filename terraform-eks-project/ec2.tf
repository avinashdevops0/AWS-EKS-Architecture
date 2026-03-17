resource "aws_instance" "toys_public_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.toys_public_subnet[0].id

  vpc_security_group_ids = [
    aws_security_group.toys_ec2_sg.id
  ]

  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "toys-public-ec2"
  }
}