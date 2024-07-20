# Assignment 24

## Goals

- Create 3 EC2 Instances (with AMI, Instance Type and Tags) using count
  - for db, backend, frontend
- Create an Security Group for the instances
- Instead of hardcoding the values in code, use variables and access them
- If name of instances is db, instance type should be t2.small, else t2.micro
- Use length([]), merge({}, {}), join(",", []) and split(",", "") functions
- Create route 53 records for
  - harshadevops.site using public ip for frontend instance
  - db.harshadevops.site using private ip for db instance
  - backend.harshadevops.site using private ip for backend instance
- Use string interpolation when required (combining strings and variables)
- Use locals for expressions, if required
- Use data sources for getting ami_id (id changes with update), default vpc_id and zone_id for r53

---

- Use Remote State instead of Local State
  - Create a S3 bucket (for remote state)
  - Create a DynamoDB Table with Partition key == LockID (for state locking)
  - Use the S3 bucket along with key and DB Table in Remote State Config
  - Note give different key for each project
- Use for loop instead of count, change default values if required

  - instance_names = {db: "t2.small", ...}
  - Modify r53 code using the output of instances (observe keys), for instances map

- Use Dynamic blocks in Security Groups to accept more ports

## Questions
