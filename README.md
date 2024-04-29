# experimenting-terraform
Repository to store all the terraform related code samples, articles, information docs and much more!

### Terraform Init -
- Safe to run multiple times
- Some of the options for the command:
	- -input=true Ask for input if necessary. If false, will error if input was required.
	- -lock=false Disable locking of state files during state-related operations.
	- -lock-timeout=<duration> Override the time Terraform will wait to acquire a state lock. The default is 0s (zero seconds), which causes immediate failure if the lock is already held by another process.
	- -no-color Disable color codes in the command output.
 	- -upgrade Opt to upgrade modules and plugins as part of their respective installation steps. See the sections below for more details.
 
### Terraform Plan -
- creates execution plan which lets one to preview the changes to be made.
- Workflow -
  	- reads current state of already created remote objects
  	- compare current state with prior state and lists out differences
  	- proposes set of actions, if applied, can make changes to remote objects to match desired configuration.
- `-out=FILE` can be used to save plan to the file on the disk.
- `-target=resource_address` can be used to target particular resource and plan for that resource.
- `-var-file=file` can be used to supply values to variables mentioned in the configuration.
- `-replace=resource_address` is used to replace the mentioned resource or resource configuration that has been degraded or faulty instead of all the resources. It is also known as resource tainting.

### Terraform Apply - 
- executes the action proposed by the terraform plan command.
- Options -
	- `-auto-approve` skips the interactive approval the plan before applying. Gets skipped automatically when used a plan file instead.
 	- `-input=false` disables all the terraform's interactive prompts.
    
### Terraform Destroy - 
- convenient way to destroy all the remote objects described in the terraform configurations.
- `terraform apply -destroy` or `terraform destroy` can be used to perform the destroy operations.
- `terraform plan -destroy` can be used to get information about the resources to be destroyed without destroying them.
  
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
