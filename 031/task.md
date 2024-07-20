## Expense Project Using Terraform

- Using VPC Module (previously created) construct a VPC
- Create Security Groups Modules using custom modules
- Use SSM Parameter Store when required (User's Responsibility)
  - General Format is `/project_name/environment/variable_name` (MUST START WITH /)
  - Module Developer's Responsibility is expose data when required (by output)
- Create Security Group Rules for components using sg to sg instead of changing IP always

## Desired Result

![](../assignment-svgs/vpc-v5.drawio.svg)
