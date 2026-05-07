variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}   

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "The location of the virtual network provided by resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the main resource group"
  type        = string
  
}

variable "tags" {
  description = "The tags for the virtual network"
  type        = map(string)
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}