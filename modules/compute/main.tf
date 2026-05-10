resource "aws_key_pair" "ssh_key" {
  key_name   = "aws-ssh-key-tf"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "vm" {
  ami = var.ami_id  
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = var.tags
  key_name = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [ var.security_group_id ]
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
}