resource "azurerm_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = var.resource_group_name
  location = var.location
  network_interface_ids = var.network_interface_ids
  vm_size = var.vm_size
  storage_os_disk {
    name = "${var.vm_name}-osdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    disk_size_gb = var.disk_size_gb
  }
  tags = var.tags
}