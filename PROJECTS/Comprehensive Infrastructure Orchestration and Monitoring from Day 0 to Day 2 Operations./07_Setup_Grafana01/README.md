# 07_setup_grafana01
Grafana is an open-source platform for monitoring and observability, designed to visualize and analyze metrics from various data sources. It is commonly used in conjunction with time-series databases, such as Prometheus, InfluxDB, and Graphite, to create dynamic and interactive dashboards for monitoring applications, systems, and infrastructure.
![Slide8](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/f424061d-0ccc-4318-9147-88cda3d8ad3b)

## Objectives
- Setup Grafana for this workshop to Monitoring your system via Dashboard.
- Setup Grafana Datasource: Zabbix - to monitoring machine metrics
- Setup Grafana Datasource: Prometheus - to monitoring kubernetes metrics
- Learn how to use Grafana to set up a monitoring solution for your system.

## Expected Outcome
- Grafana is ready to use.

## Prerequisites
- no prerequisites

## Installation
> [!NOTE]
> The following instruction for the [zabbix-server] only.

### Prepare Grafana repository by create .repo file at /etc/yum.repos.d/grafana.repo 
```sh
#vi /etc/yum.repos.d/grafana.repo 
[grafana] 
name=grafana 
baseurl=https://packages.grafana.com/oss/rpm 
repo_gpgcheck=1 
enabled=1 
gpgcheck=1 
gpgkey=https://packages.grafana.com/gpg.key 
sslverify=1 
sslcacert=/etc/pki/tls/certs/ca-bundle.crt 
```
### Install Grafana
```sh
dnf install grafana -y
```
### Install Plugin zabbix
```sh
grafana-cli plugins install alexanderzobnin-zabbix-app
```
### Enable Grafana service
```sh
systemctl enable --now grafana-server.service
```
### (optional) On my laptop create tunnel connect  to EC2 
```sh
#ssh -L 3000:private_ip:3000 cloud-user@public_ip -i dl-labs-20.pem 
```

## Verify
Open Grafana UI web page
```sh
http://<public-ip-address>:3000/grafana
```

## Step-by-Step: How to import zabbix datasource to Grafana
### Objective
- [ ] Follow the instructions in the document named "example.docx"