variable "cidr_block" {
	description 	= "This is the definition of cidr block" 
}

variable "http_port" {
	description 	= "This port is opened for web access" 
}

variable "ssh_port" {
	description 	= "This port is defined for ssh access" 
}

variable "random_port" {
	default 	= "8080"
	description 	= "This is the definition for variable random_port" 
}
