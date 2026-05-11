

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
  for_each = toset(var.instances)

  source            = "./modules/compute"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.networking.id_subnet
  tags              = var.tags
  public_key_path   = var.public_key_path
  security_group_id = module.security.security_group_id
  key_name          = aws_key_pair.ssh_key.key_name
}

