output "id_subnet" {
  description = "The id of the subnet"
  value = aws_subnet.public_subnet.id
}