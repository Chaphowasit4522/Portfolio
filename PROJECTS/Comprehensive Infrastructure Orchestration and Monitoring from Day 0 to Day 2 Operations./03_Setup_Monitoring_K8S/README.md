# 03_setup_monitoring_k8s
Metrics Server is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.
![Slide4](https://github.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/assets/49383429/9c0b5b49-3de9-407d-a349-3f0a233372fe)


## 1) install Metric servers
```sh
kubectl apply -f https://raw.githubusercontent.com/chayapon-s/kbtg-infra-kampus-bootcamp2024/main/instruction_day1/yaml/metric-server-k8s.yml
```

### Verify
Now you can verify that all objects exist and can collect CPU/Memory metrics.
Get pod metrics
```sh
kubectl top pod
```

The response should be like this:
```sh
NAME                               CPU(cores)   MEMORY(bytes)
wordpress-66d6c4fd9-7nzgm          1m           125Mi
wordpress-mysql-86b9f64c4c-qzdll   4m           509Mi
```
Get node metrics
```sh
kubectl top nodes
```

The response should be like this:
```sh
NAME                 CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
k8s-master01.local   182m         9%     1849Mi          24%
k8s-worker01.local   93m          4%     1871Mi          24%
k8s-worker02.local   69m          3%     1526Mi          20%
```

## 2) Setup Prometheus for kubernetes cluster
### installl git
```sh
dnf install git
```

### Prepare Prometheus packages
```sh
git clone -b release-0.7 https://github.com/prometheus-operator/kube-prometheus.git
```

### Prepare kubernetes resources for prometheus
```sh
cd kube-prometheus
kubectl create -f manifests/setup
kubectl create -f manifests/
```
### Verify that the Service is running by running the following command:
```sh
kubectl get svc -n monitoring
```
The response should be like this:
```sh
NAME                 TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
alertmanager-main       ClusterIP   10.96.49.118     <none>        9093/TCP                     22s
alertmanager-operated   ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   23s
grafana                 ClusterIP   10.96.5.162      <none>        3000/TCP                     19s
kube-state-metrics      ClusterIP   None             <none>        8443/TCP,9443/TCP            18s
node-exporter           ClusterIP   None             <none>        9100/TCP                     17s
prometheus-adapter      ClusterIP   10.105.3.238     <none>        443/TCP                      17s
prometheus-k8s          ClusterIP   10.101.106.161   <none>        9090/TCP                     15s
prometheus-operated     ClusterIP   None             <none>        9090/TCP                     16s
prometheus-operator     ClusterIP   None             <none>        8443/TCP                     28s
```
### Change network from ClusterIP to NodePort
```sh
kubectl --namespace monitoring patch svc prometheus-k8s -p '{"spec": {"type": "NodePort"}}'
```
### Verify that the Service is running by running the following command:
```sh
kubectl get svc -n monitoring | grep prometheus-k8s
```
The response should be like this:
```sh
prometheus-k8s          NodePort    10.101.106.161   <none>        9090:30957/TCP               6m3s
```

### Copy the Public IP address for master node, and load the page in your browser to view your site with 30957 (see port from service prometheus-k8s )
```sh
http://<master-ipaddress>:30957
```