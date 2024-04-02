variable "instance_type" {
  default     = "t2.micro"
  description = "This is to define which instance type to be used"
}

variable "security_groups" {
  type        = list(any)
  default     = []
  description = "this will be used to attach sg to ec2"
}
