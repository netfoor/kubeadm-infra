module "networking" {
  source               = "./modules/networking"
  virtual_network_name = var.virtual_network_name
  address_space        = var.address_space

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags

  address_prefixes = var.address_prefixes

}

module "compute" {
  source              = "./modules/compute"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  vm_name      = var.vm_name
  vm_size      = var.vm_size
  disk_size_gb = var.disk_size_gb
  subnet_id    = module.networking.id_subnet
  tags         = var.tags
}

module "security" {
  source              = "./modules/security"
  security_group_name = var.security_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags

  id_interface = module.compute.id_interface
}