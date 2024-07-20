# Assignment 22

## Goals

- Create 3 EC2 Instances with seperate definition (with AMI, Instance Type and Tags)
- Create an Security Group for the instances
- Instead of hardcoding the values in code, use variables in a file and access them
- Omit default value for a variable, check what happens
- Use terraform.tfvars to override some variables (or somename.tfvars)
- Override values using CLI
  - terraform apply -var="instance_type='t3.micro'"
  - terraform apply -var-file="somename.tfvars" (Not required for terraform.tfvars)
- Override values using Environment variables
  - export TF_VAR_instance_type="t2.small"
- If name of instances is db, instance type should be t2.small, else t2.micro
- Instead of manually creating 3 instances, use count, each instance should have different names
  - db, backend, frontend
- Use length([]), merge({}, {}), join(",", []) and split(",", "") functions
- Output public and private ip of any one instance

## Questions
