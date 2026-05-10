resource "aws_instance" "vm" {
  ami = var.ami_id  
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = var.tags
  key_name = var.key_name
  vpc_security_group_ids = [ var.security_group_id ]
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
}