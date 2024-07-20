# Assignment 23

## Goals

- Create 3 EC2 Instances (with AMI, Instance Type and Tags) using count
  - names: db, backend, frontend
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

## Questions
