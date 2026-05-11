output "public_ip" {
  value = [
    for instance in module.compute : instance.public_ip
  ]
}