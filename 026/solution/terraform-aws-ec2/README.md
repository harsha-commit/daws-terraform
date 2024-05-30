# Terraform AWS EC2 Module

## Inputs

- **ami(string, optional)**: AMI ID of the EC2 Instance. Default value is `ami-090252cbe067a9e58`
- **instance_type(string, optional)**: Instance Type of the EC2 Instance. Default value is `t3.micro`
- **tags(map(any), optional)**: Tags for the EC2 Instance. Default value is `{}`
- **port(number, optional)**: Port for the security group. Default value is `0`
- **protocol(string, optional)**: Protocol for the security group. Default value is `-1`
- **cidr_blocks(list(string), optional)**: Protocol for the security group. Default value is `[]`

## Outputs

- **public_ip**: Public IP of the EC2 Instance
- **private_ip**: Private IP of the EC2 Instance
