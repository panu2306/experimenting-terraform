## Input Variables - 
### The body of the variable declaration can contain the following optional parameters:

- description
It’s always a good idea to use this parameter to document how a variable is used. Your teammates will be able to see this description not only while reading the code but also when running the plan or apply commands (you’ll see an example of this shortly).

- default
There are a number of ways to provide a value for the variable, including passing it in at the command line (using the -var option), via a file (using the -var-file option), or via an environment variable (Terraform looks for environment variables of the name TF_VAR_<variable_name>). If no value is passed in, the variable will fall back to this default value. If there is no default value, Terraform will interactively prompt the user for one.

- type
This allows you to enforce type constraints on the variables a user passes in. Terraform supports a number of type constraints, including string, number, bool, list, map, set, object, tuple, and any. It’s always a good idea to define a type constraint to catch simple errors. If you don’t specify a type, Terraform assumes the type is any.

- validation
This allows you to define custom validation rules for the input variable that go beyond basic type checks, such as enforcing minimum or maximum values on a number. You’ll see an example of validations in Chapter 8.

- sensitive
If you set this parameter to true on an input variable, Terraform will not log it when you run plan or apply. You should use this on any secrets you pass into your Terraform code via variables: e.g., passwords, API keys, etc. I’ll talk more about secrets in Chapter 6.

#### Examples :  
Here is an example of an input variable that checks to verify that the value you pass in is a number:
```
variable "number_example" {
  description = "An example of a number variable in Terraform"
  type        = number
  default     = 42
}
```
And here’s an example of a variable that checks whether the value is a list:
```
variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}
```
You can combine type constraints, too. For example, here’s a list input variable that requires all of the items in the list to be numbers:
```
variable "list_numeric_example" {
  description = "An example of a numeric list in Terraform"
  type        = list(number)
  default     = [1, 2, 3]
}
```
And here’s a map that requires all of the values to be strings:
```
variable "map_example" {
  description = "An example of a map in Terraform"
  type        = map(string)

  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}
```
You can also create more complicated structural types using the object type constraint:
```
variable "object_example" {
  description = "An example of a structural type in Terraform"
  type        = object({
    name    = string
    age     = number
    tags    = list(string)
    enabled = bool
  })

  default = {
    name    = "value1"
    age     = 42
    tags    = ["a", "b", "c"]
    enabled = true
  }
}
```

## Output Variables - 
Terraform also allows you to define output variables by using the following syntax:
```
output "<NAME>" {
  value = <VALUE>
  [CONFIG ...]
}
```
- The NAME is the name of the output variable, and VALUE can be any Terraform expression that you would like to output. The CONFIG can contain the following optional parameters:

- description
It’s always a good idea to use this parameter to document what type of data is contained in the output variable.

- sensitive
Set this parameter to true to instruct Terraform not to log this output at the end of plan or apply. This is useful if the output variable contains secrets such as passwords or private keys. Note that if your output variable references an input variable or resource attribute marked with sensitive = true, you are required to mark the output variable with sensitive = true as well to indicate you are intentionally outputting a secret.

- depends_on
Normally, Terraform automatically figures out your dependency graph based on the references within your code, but in rare situations, you have to give it extra hints. For example, perhaps you have an output variable that returns the IP address of a server, but that IP won’t be accessible until a security group (firewall) is properly configured for that server. In that case, you may explicitly tell Terraform there is a dependency between the IP address output variable and the security group resource using depends_on.

For example, instead of having to manually poke around the EC2 console to find the IP address of your server, you can provide the IP address as an output variable:
```
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
```
You can also use the terraform output command to list all outputs without applying any changes:
```
$ terraform output
public_ip = "54.174.13.5"
```


