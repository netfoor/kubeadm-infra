output "ip_public" {
  description = "The Public IP of the machine"
  value = azurerm_public_ip.ip.ip_address
}