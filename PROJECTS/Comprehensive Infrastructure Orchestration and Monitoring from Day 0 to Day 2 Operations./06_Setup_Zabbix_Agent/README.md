# 06_setup_zabbixagent
The Zabbix Agent is a crucial component of the Zabbix monitoring system, responsible for collecting data from the systems it runs on and sending that information to the Zabbix Server for processing.
![Slide7](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/379fb96c-cd7b-42bc-a6a2-a9f3ec794685)

## Objectives
- Setup Zabbix Server for monitoring metrics on your system.

## Expected Outcome
- The Zabbix Agent is ready to use, and the Zabbix server can collect metrics for all EC2 machines.

## Prerequisites
- Must finish task
    - 04_setup_ansible
    - 05_setup_zabbixserver

## Installation
> [!NOTE]
> The following instruction for the [helper] only.

Use this Ansible playbook YAML to install the Zabbix Agent on all your machines.
*Should be Prepare install_zabbix-agent2.yml file from assets\install_zabbix-agent2.yml*

Execute following command
```sh
ansible-playbook -i hosts install_zabbix-agent2.yml
```

## Verify
> [!NOTE]
> The following instruction for the non [helper] server only.
Check zabbix-agent2 on another machines

```sh
systemctl status zabbix-agent2
```
The response should be like this:
```sh
[root@k8s-master01 ~]# systemctl status zabbix-agent2
● zabbix-agent2.service - Zabbix Agent 2
   Loaded: loaded (/usr/lib/systemd/system/zabbix-agent2.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2024-01-11 13:26:56 +07; 22h ago
Main PID: 580373 (zabbix_agent2)
    Tasks: 8 (limit: 48661)
   Memory: 20.8M
   CGroup: /system.slice/zabbix-agent2.service
           └─580373 /usr/sbin/zabbix_agent2 -c /etc/zabbix/zabbix_agent2.conf
 
Jan 11 13:26:56 k8s-master01.local systemd[1]: Started Zabbix Agent 2.
Jan 11 13:26:56 k8s-master01.local zabbix_agent2[580373]: Starting Zabbix Agent 2 (6.0.0)
Jan 11 13:26:56 k8s-master01.local zabbix_agent2[580373]: Zabbix Agent2 hostname: [172.31.28.74]
Jan 11 13:26:56 k8s-master01.local zabbix_agent2[580373]: Press Ctrl+C to exit.
```