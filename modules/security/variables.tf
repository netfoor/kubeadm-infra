variable "security_group_name" {
  description = "The name of the network security group"
  type        = string
  
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
  
}

variable "tags" {
  description = "The tags for the network security group"
  type        = map(string)
  
}
