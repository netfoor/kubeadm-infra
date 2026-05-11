resource "aws_key_pair" "ssh_key" {
  key_name   = "aws-ssh-key-tf"
  public_key = file(var.public_key_path)
}

module "networking" {
  source = "./modules/networking"
  tags   = var.tags

}

module "security" {
  source              = "./modules/security"
  security_group_name = var.security_group_name
  vpc_id              = module.networking.vpc_id
  tags                = var.tags
}


module "compute" {
  for_each = var.instances

  source            = "./modules/compute"
  ami_id            = var.ami_id
  instance_type     = each.value.instance_type
  subnet_id         = module.networking.id_subnet
  tags              = merge(var.tags, { name = "instance-${each.key}" })
  security_group_id = module.security.security_group_id
  key_name          = aws_key_pair.ssh_key.key_name
}

