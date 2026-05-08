variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR block for the public subnet."
  type        = list(string)
  default = ["10.0.1.0/24"]
}

variable "tags" {
  description = "The tags for the VPC and its subnets."
  type        = map(string)
}