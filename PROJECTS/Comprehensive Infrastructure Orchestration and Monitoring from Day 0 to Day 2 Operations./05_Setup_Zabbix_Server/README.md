# 05_setup_zabbixserver
Zabbix is an open-source monitoring solution designed to monitor the performance and availability of various network services, servers, and other IT resources. The Zabbix Server is a crucial component of the Zabbix monitoring system.
![Slide6](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/35c49f15-7b80-4bd5-8929-ee4aa944ccf5)


## Objectives
- Setup Zabbix Server for monitoring metrics on your system.

## Expected Outcome
- Zabbix Server is ready to use.

## Prerequisites
- no prerequisites

## 1) Installation | Prepare Server 
> [!NOTE]
> The following instruction for the [zabbis-server] only.

### Disable selinux
```sh
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
```

### Set time zone Asia/Bangkok 
```sh
timedatectl set-timezone Asia/Bangkok
```

### Update all packages
```sh
dnf update -y 
```
### Reboot server to take effect
```sh
reboot
```
### Set hostname
```sh
hostnamectl set-hostname zabbix-server.local
```

## 2) Installation | Install Database Server
```sh
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup 
bash mariadb_repo_setup --mariadb-server-version=10.5 
dnf makecache 
dnf repolist 
dnf module reset mariadb -y 
dnf install MariaDB-server MariaDB-client MariaDB-backup -y
rpm -qi  MariaDB-server
systemctl start mariadb
systemctl enable mariadb
```

### Setup MySQL Secure installation
กำหนด password ของ root database ( ตอบ yes ทุกข้อ )
```sh
mysql_secure_installation 
```

## 3) Installation | Install Zabbix Server
### Install Zabbix repository
```sh
rpm -Uvh https://repo.zabbix.com/zabbix/6.4/rhel/8/x86_64/zabbix-release-6.4-1.el8.noarch.rpm 
dnf clean all  
```

### Switch DNF module version for PHP
```sh
dnf module switch-to php:7.4  
```

### Install Zabbix server, frontend, agent
```sh
dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent -y 
```

### Create initial database
```sh
mysql -uroot -p 
password 
# ---
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin; 
mysql> create user zabbix@localhost identified by 'password'; 
mysql> grant all privileges on zabbix.* to zabbix@localhost; 
mysql> set global log_bin_trust_function_creators = 1; 
mysql> quit;   
```

### Import schema 
```sh
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix  
#password prompt: password 
```
Edit file /etc/zabbix/zabbix_server.conf
```sh
DBPassword=password
```

Disable log_bin_trust_function_creators option after importing database schema
```sh
mysql -uroot -p 
#password prompt: password 
# ---
mysql> set global log_bin_trust_function_creators = 0; 
mysql> quit;  
```

And then, Restart zabbix server
```sh
systemctl restart zabbix-server zabbix-agent httpd php-fpm 
systemctl enable zabbix-server zabbix-agent httpd php-fpm
```

## Verify
### Open Zabbix UI web page
```sh
http://host/zabbix 
default user / pass <Admin/zabbix>
```

### On my laptop create tunnel connect to your EC2 (optional)
```sh
ssh -L 8081:private_ip:80 cloud-user@public_ip -i dl-labs-20.pem
```
