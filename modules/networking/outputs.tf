output "id_subnet" {
  description = "The id of the subnet"
  value = aws_subnet.public_subnet.id
}

output "vpc_id" {
  description = "The id of the VPC"
  value = aws_vpc.vpc.id
}