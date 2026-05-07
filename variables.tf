variable "virtual_network_name" {
  description = "The name of the virtual network to create."
  type        = string

}

variable "address_space" {
  description = "The address space of the virtual network."
  type        = list(string)

}


variable "address_prefixes" {
  description = "The address prefixes to use for the virtual network."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "terraform-azure-kubeadm"
    owner       = "Fortino Romero"
  }
}

variable "vm_name" {
  description = "The name of the virtual machine to create."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine to create."
  type        = string
}

variable "disk_size_gb" {
  description = "The size of the OS disk in GB."
  type        = number
}

variable "security_group_name" {
  description = "The name of the network security group to create."
  type        = string

}