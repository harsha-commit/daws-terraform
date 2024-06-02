## Expense Project Using Terraform

- Ready the Existing VPC State by (Inside `solution/expense-terraform-dev`)
  - `for i in 01-vpc/ 02-sg/ 03-bastion/ 04-db/ ; do cd $i; terraform apply -auto-approve; cd .. ; done`
  - `for i in 09-frontend/ 08.2-frontend-alb/ 08.1-acm/ 07-backend/ 06-backend-alb/ 05-openvpn/ 04-db/ 03-bastion/ 02-sg/ 01-vpc/ ; do cd $i; terraform destroy -auto-approve -lock=false; cd .. ; done`
- Create R53 record for RDS Endpoint (Note that end point is domain, not IP Address)
- Create R53 records for backend and frontend
  - For frontend, create for both public and private ip
- Create Ansible Instance
  - Using userdata, install ansible and run ansible playbook for
    - backend (also update password)
    - frontend
  - Ansible should communicate to private ip of all
    - Check that playbook should point to private IP's domain name
- Test connecting backend through bastion and check status of backend, similarly for frontend
- Destroy the infrastructure (Inside `solution/expense-terraform-dev`)
  - `for i in $(ls -dr */); do cd ${i%/}; terraform destroy -auto-approve; cd ..; done`
  - `for i in 05-apps/ 04-db/ 03-bastion/ 02-sg/ 01-vpc/ ; do cd $i; terraform destroy -auto-approve; cd .. ; done`

## Existing VPC State

![](../assignment-svgs/vpc-v6.drawio.svg)

## Desired Result

![](../assignment-svgs/vpc-v7.drawio.svg)
