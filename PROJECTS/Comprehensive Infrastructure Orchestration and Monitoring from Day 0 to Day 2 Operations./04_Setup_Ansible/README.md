# 04_setup_ansible
Ansible is an open-source automation tool that is used for configuration management, application deployment, task automation, and orchestration. Developed by Red Hat, Ansible simplifies complex tasks and processes, allowing users to manage and automate infrastructure more efficiently.
![Slide5](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/b3e2052f-5430-4815-aa9d-fa2108e713c0)

## Objectives
- Setup Ansible for this workshop to automate tasks in the future.

## Expected Outcome
- Ansible is ready to use.

## Prerequisites
- no prerequisites

## Installation
> [!NOTE]
> The following instruction for the [helper] only.

### Set time zone
```sh
timedatectl set-timezone Asia/Bangkok
```

### Install ansible packages
```sh
dnf install -y epel-release 
dnf install -y ansible 
```

### Disable host checking
```sh
#vi /etc/ansible/ansible.cfg 
[defaults] 
host_key_checking = False 
```

### Prepare Ansible Inventory
Prepare ansible directory
```sh
mkdir ansible 
cd ansible 
```

Prepare ansible inventory (hosts).
```sh
#vi hosts 
[myhost] 
k8s-master01.local
k8s-worker01.local
k8s-worker02.local

[all:vars] 
ansible_connection=ssh 
ansible_ssh_user=cloud-user 
ansible_ssh_private_key_file=/root/ansible/dt-labs-xx.pem 
ansible_become=true 
```

## Verify
Run this command to get ansible version
```sh
ansible --version 
```
The response should be like this
```sh
# ansible --version
ansible [core 2.16.2]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.11/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /bin/ansible
  python version = 3.11.5 (main, Oct 25 2023, 14:45:39) [GCC 8.5.0 20210514 (Red Hat 8.5.0-21)] (/usr/bin/python3.11)
  jinja version = 3.1.2
  libyaml = True 
```

## Verify(2)
Try to run example ansible adhoc command
```sh
ansible -i hosts myhost -m ping
```

## (optional) and try to run ansible-playbook to create linux user to another machines

### Create new user name example-user
```sh
#cat example-createuser.yml
  - name: Create User for EC2 
    hosts: myhost 
    become: yes 
    become_user: root 
    tasks: 
      - name: "Create User"
        user: 
          name: "{{ item }}" 
          group: bin 
          shell: /bin/bash 
          home: "/home/{{ item }}" 
        with_items: 
          - example-user
```
_or can download this yaml file from: https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/assets/ansible-playboox-examples/example-createuser.yml_

And run following command:
```sh
ansible-playbook -i hosts example-createuser.yml
```

### Remove user name example-user
```sh
#cat example-deleteuser.yml
  - name: Remove User for EC2 
    hosts: myhost 
    become: yes 
    become_user: root 
    tasks: 
      - name: "Remove User" 
        user: 
          name: "{{ item }}" 
          group: bin 
          shell: /bin/bash 
          home: "/home/{{ item }}" 
          state: absent 
        with_items: 
          - example-user
```
_or can download this yaml file from: https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/assets/ansible-playboox-examples/example-deleteuser.yml_

And run following command:
```sh
ansible-playbook -i hosts example-deleteuser.yml
```