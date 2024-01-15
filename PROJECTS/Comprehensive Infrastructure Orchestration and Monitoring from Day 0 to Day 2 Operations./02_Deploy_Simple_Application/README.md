# 02 Deploy Simple Application on Kubernetes Cluster
Let's deploy simple application name "WORDPRESS" on your kubernetes cluster 
, inspired from https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
![Slide3](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/aa536acb-484e-4422-b50a-46b73b9af849)

## Getting Started
This tutorial demonstrates how to deploy a WordPress site and a MySQL database using a Kubernetes cluster (excluding PersistentVolume for stateful purposes).

## Objectives
- Create a WordPress deployment as a web application.
- Create a NodePort-type service for the WordPress service.
- Create a MySQL deployment as a database.
- Create a secret named "mysql-pass" to store the password for your database.

## Expected Outcome
- Can Access Wordpress via Public IP of Master node with NodePort

## Prerequisites
- Must finish task
    - 01_setup_k8s

## Installation
### 1. Create Secret name "mysql-pass"

Download the secret file.
```sh
kubectl apply -f https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/yaml/mysql-pass-secret.yml
```

### 2. Deploy MySQL deployment

Download the MySQL deployment configuration file.
```sh
kubectl apply -f https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/yaml/mysql-deployment.yaml
```

### 3. Deploy Wordpress deployment

Download the WordPress configuration file.
```sh
kubectl apply -f https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/yaml/wordpress-deployment.yaml
```

## Verify
Now you can verify that all objects exist.

1. Verify that the Secret exists by running the following command:
```sh
kubectl get secrets
```

The response should be like this:
```sh
NAME                    TYPE                                  DATA   AGE
mysql-pass-c57bb4t7mf   Opaque                                1      9s
```

2. Verify that the Pod is running by running the following command:
```sh
kubectl get pods
```

The response should be like this:
```sh
NAME                               READY     STATUS    RESTARTS   AGE
wordpress-mysql-1894417608-x5dzt   1/1       Running   0          40s
```

3. Verify that the Service is running by running the following command:
```sh
kubectl get service wordpress
```

The response should be like this:
```sh
NAME        TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
wordpress   NodePort   10.96.71.154   <none>        80:30172/TCP   29m
```

4. Copy the Public IP address for master node, and load the page in your browser to view your site with port 30172 (see port from service wordpress).
```sh
http://<master-ipaddress>:30172/wp-admin/
```

You should see the WordPress set up page similar to the following screenshot.

![WordPress](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/ca9e0dc0-8d9d-48a8-b368-4948678dc80b)