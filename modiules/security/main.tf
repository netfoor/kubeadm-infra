resource "azurerm_network_security_group" "sg" {
  name = var.security_group_name
  location = var.location
  resource_group_name = var.resource_group_name
  
  security_rule = {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = var.id_interface
  network_security_group_id = azurerm_network_security_group.sg.id
}