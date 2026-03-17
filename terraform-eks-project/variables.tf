variable "aws_region" {
  default = "ap-south-1"
}

variable "toys_vpc" {
  default = "toys_vpc"
}

variable "toys_vpc_cidir" {
  default = "10.0.0.0/16"
}

variable "toys_vpc_instance_tenancy" {
  default = "default"
}

variable "toys_vpc_public_cidir" {
  type = list(string)
}

variable "toys_vpc_private_cidir" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "key_name" {
  description = "EC2 key pair"
}