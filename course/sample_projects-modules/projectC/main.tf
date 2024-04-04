module "network-resources" {
  source = "../../modules/vpc"
}

module "security-resources" {
  source = "../../modules/security_group"
  vpc_id = module.network-resources.vpc_id
}

module "ec2-resources" {
  source = "../../modules/ec2"

  security_group_id = module.security-resources.security_group_id
  public_subnet_id  = module.network-resources.public_subnet_id

}
