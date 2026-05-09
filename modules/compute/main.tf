resource "aws_instance" "vm" {
  ami = var.ami_id  
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = var.tags
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
}