module "sgModule" {
  source = "../../modules/security_group"
}

module "ec2Module" {
  source          = "../../modules/ec2"
  instance_type   = "t2.large"
  security_groups = [module.sgModule.sg_name]
}

output "my-val" {
	value = module.sgModule.sg_name
}
