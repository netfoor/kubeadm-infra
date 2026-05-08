resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = "Security group for the virtual machine"
  vpc_id      = module.networking.vpc_id

  ingress = {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    description = "Allow all TCP/UDP outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
  
}