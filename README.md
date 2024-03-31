# experimenting-terraform
Repository to store all the terraform related code samples, articles, information docs and much more!


### Variables in TF - 
Variable definition - 
```
variable "variable_name" {
	default = "VALUE_TO_BE_ASSIGNED"
}
```

variable call - 
```
attribute = var.variable_name
```

### Ways to define values for variable - 
1. Using default value in variable.tf file while declaration
2. Using `variable name = variable_value` in `*.tfvars` file.
3. Using environment variable that starts with `TF_VAR_`, for example - `TF_VAR_MY_VARIABLE = value`
4. If nothing above is mention, at command line too we can mention variable value or terraform automatically ask for it if not given/present. 

```
NOTE: If in all the ways mentioned above, the variable value is given then the value given at later stage has given the precedence. 
```
