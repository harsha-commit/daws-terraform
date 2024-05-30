## Naming Conventions (by AWS)

- Assume project name is `expense`
- For VPC
  - `expense-vpc`
- For Subnets
  - `expense-subnet-public1-us-east-1a`
  - `expense-subnet-private1-us-east-1a`
- For Route Tables
  - `expense-rtb-public`
  - `expense-rtb-private1-us-east-1a`
- For Internet Gateway
  - `expense-igw`

## Steps

1. Create VPC - configure name, VPC CIDR block (10.0.0.0/16), tags
2. Create subnets for public, private and database - configure AZ, subnet CIDR
3. Public subnet CIDRs: 10.0.1.0/24, 10.0.2.0/24
4. Private subnet CIDRs: 10.0.11.0/24, 10.0.12.0/24
5. Database subnet CIDRs: 10.0.21.0/24, 10.0.22.0/24
6. Create Internet Gateway to make subnets public, and attach it to the VPC
7. Create Elastic IP for NAT Gateway
8. Create NAT Gateway for private and database subnets inside public subnet
9. Create Route tables for public, private and database (Note that default Route table is already created)
10. Edit route of public route table, to point to Internet Gateway for internet
11. Edit route of private and database route tables, to point to NAT Gateway for internet
12. Associate Route tables to corresponding subnets
