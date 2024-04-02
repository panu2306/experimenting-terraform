variable "cidr_block" {
  description = "This is the definition of cidr block"
}

variable "http_port" {
  description = "This port is opened for web access"
}

variable "ssh_port" {
  description = "This port is defined for ssh access"
}

variable "random_port" {
  default     = "8080"
  description = "This is the definition for variable random_port"
}

variable "ami_list" {
  type = map(any)
  default = {
    "us-east-1" = "ami-080e1f13689e07408"
    "us-east-2" = "ami-0b8b44ec9a8f90422"
    "us-west-1" = "ami-05c969369880fa2c2"
    "us-west-2" = "ami-08116b9957a259459"
  }
}

variable "regions" {
  type = list(string)
}
