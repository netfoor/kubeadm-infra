output "ip_public" {
  description = "The Public IP of the machine"
  value = azurerm_public_ip.ip.ip_address
}

output "id_interface" {
  description = "The id of the network interface"
  value = azurerm_network_interface.interface.id
}