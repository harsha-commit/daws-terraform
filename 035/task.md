# Expense Infra Dev Project

- Prerequisites: 01-vpc/ 02-sg/
- Use pull based architecture, instead of push based
  - Delete Ansible server and it's related configurations
- Create Security Group for backend-alb and VPN
  - Configure SG Rules and update other rules, parameters if required
  - Note that RDS accepts only 3306 ingress and not 22 (AWS Managed)
  - Note that there are multiple SG Rules for VPC
- Create userdata for bastion to install mysql
- Create VPN (before that subscribe to openvpn AMI)

- Details of OpenVPN

  - username = openvpnas
  - keybased AMI
  - Do
    - cd ~/.ssh/
    - ssh-keygen -f openvpn

- In 04-openvpn/

  - Use keypair resource for importing public key

- `ssh -i ~/.ssh/openvpn openvpnas@<IP_OF_VPN>`
- yes to agreement, provide password (Abcd@1234)

- Admin Details

  - username: openvpn (for client too)
  - password: Abcd@1234
  - VPN Settings
    - Should client Internet traffic be routed through the VPN? YES
    - Have clients use specific DNS servers? YES
      - 8.8.8.8
      - 8.8.4.4
    - Save Settings and Update Running Server

- Download OpenVPN Client

- Create Backend ALB with ALB Listener
- Create R53 record for ALB `*-app-dev.harshadevops.site`

## Existing VPC

![](../assignment-svgs/vpc-v7.drawio.svg)
