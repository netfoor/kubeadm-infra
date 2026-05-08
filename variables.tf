variable "ami_id" {
  description = "The AMI ID to use for the instance."
  type        = string
  default     = "ami-0fe18bc3cfa53a248"
}

variable "instance_type" {
  description = "The type of instance to create."
  type        = string
  default     = "t3.small"
}

variable "security_group_name" {
  description = "The name of the network security group to create."
  type        = string
  default     = "nsg-terraform-kubeadm"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    environment = "dev"
    project     = "terraform-aws-kubeadm"
    owner       = "Fortino Romero"
  }
}
