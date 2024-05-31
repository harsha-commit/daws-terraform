#!/bin/bash
# User data will get sudo access
dnf install ansible -y

cd /tmp
git clone https://github.com/harsha-commit/expense-ansible-roles.git

# Inventory file is already in ansible.cfg
cd expense-ansible-roles # Point of Mistake, not moving into directory
ansible-playbook main.yaml -e component=backend -e login_password=ExpenseApp1

ansible-playbook main.yaml -e component=frontend