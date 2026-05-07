resource "azurerm_public_ip" "ip" {
  name = "${var.vm_name}-publicip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
}

resource "azurerm_network_interface" "interface" {
  name = "${var.vm_name}-nic"
  location = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "${var.vm_name}-ipconfig"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = var.resource_group_name
  location = var.location
  network_interface_ids = [azurerm_network_interface.interface.id]
  vm_size = var.vm_size
  storage_os_disk {
    name = "${var.vm_name}-osdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    disk_size_gb = var.disk_size_gb
  }
  tags = var.tags

  // dev enviroment
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true
}


