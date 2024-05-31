## Expense Project Using Terraform

- Create Security Groups
- Create a mysql database (RDS) instance using custom module
- Use SSM Parameter Store when required (User's Responsibility)
  - Module Developer's Responsibility is expose data when required (by output)
- Create Security Group Rules for components using sg to sg instead of changing IP always

## Existing VPC State

![](../assignment-svgs/vpc-v4.drawio.svg)

## Desired Result

![](../assignment-svgs/vpc-v5.drawio.svg)
