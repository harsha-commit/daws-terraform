# Assignment 28

## Goals

- Demonstrate NAT Gateway, Route Tables, Peering with another VPC in the existing VPC
  - Provide the user a variable to choose if the VPC Peering is required or not
    - only create routes and peering connection only if required
  - If user opts for VPC Peering
    - If user provides VPC ID of second VPC, peer to it
    - Else, peer to Default VPC, auto accept only for default
- One NAT Gateway and One Route table per subnet is enough for Assignment
- Use Terraform Modules and test it
  - Provide documentation for better user experience

## Existing VPC State

![](../../assignment-svgs/vpc-v1.drawio.svg)

## Desired Result (Checkpoint)

![](../../assignment-svgs/vpc-v2.drawio.svg)

## Desired Result (Final)

![](../../assignment-svgs/vpc-v3.drawio.svg)
