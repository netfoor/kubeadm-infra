variable "security_group_name" {
  description = "The name of the network security group"
  type        = string
  
}

variable "location" {
  description = "The location of the network security group provided by resource group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the main resource group"
  type        = string
  
}

variable "tags" {
  description = "The tags for the network security group"
  type        = map(string)
  
}

variable "id_interface" {
  description = "The machine id interface"
  type = string
}