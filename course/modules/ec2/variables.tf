variable "ami_id" {
  default     = "ami-05c969369880fa2c2"
  description = "This is to define which ami is used"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "This is to define which instance type to be used"
}

variable "security_groups" {
  type        = list(any)
  default     = []
  description = "this will be used to attach sg to ec2"
}

variable "security_group_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

