
variable "vm_name" {
  description = "The name of the virtual machine"
  type = string
}

variable "resource_group_name" {
  description = "The name of the main resource group"
  type = string
}

variable "location" {
  description = "The location of the virtual machine provided by resource group"
  type = string
}

variable "network_interface_ids" {
  description = "The list of network interface IDs to associate with the virtual machine"
  type        = list(string)
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
    
}

variable "subnet_id" {
  description = "The ID of the subnet to which the network interface will be connected"
  type        = string  
  
}