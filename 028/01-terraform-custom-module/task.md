# Assignment 28.1

## Goals

- Demonstrate NAT Gateway, Route Tables, Peering with another VPC in the existing VPC
  - Provide the user a variable to choose if the VPC Peering is required or not
  - If user opts for VPC Peering
    - If he provides, VPC ID of second VPC, peer to it
    - Else, peer to Default VPC
- One NAT Gateway and One Route table per subnet is enough for Assignment
- Use Terraform Modules and test it
  - Provide documentation for better user experience

## Existing VPC State

![](./vpc-v1.drawio.svg)

## Desired Result (Checkpoint)

![](./vpc-v2.drawio.svg)

## Desired Result (Final)

![](./vpc-v3.drawio.svg)
