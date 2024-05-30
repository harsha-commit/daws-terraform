## Project Level Variables

- Project Name
- Environment
- Common Tags

## Tags

- Tags are usually a combination of common tags and resource tags (Name is generally given at resource)

## Steps

1. Create VPC - configure cidr block, dns_hostnames, dns_support, tags
2. Create public subnets - configure count, vpc_id, cidr_block, az, map_public_ip_on_launch
   - CIDR blocks are to be provided by the user
   - Perform Validation so that user can provide only 2 CIDRs
   - Choose first two AZs from the user region by data sources
3. Create private and database subnets - configure count, vpc_id, cidr_block, az
