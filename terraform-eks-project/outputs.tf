output "vpc_id" {
  value = aws_vpc.toys_vpc_main.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.prod_eks_cluster.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.prod_eks_cluster.endpoint
}

output "bastion_public_ip" {
  value = aws_instance.toys_public_ec2.public_ip
}