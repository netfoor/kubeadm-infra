variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string

}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string

}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}


variable "security_group_id" {
  description = "The ID of the security group to associate with the instance"
  type        = string
}

variable "public_key_path" {
  description = "The path to the public key file to use for the key pair"
  type        = string
  
} 