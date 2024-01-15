![Alt text](Picture/K8s.png)

> These instruction is apply for master node (k8s-master01)
### Disable selinux 
```sh
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
```
### Set time zone
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
hostnamectl set-hostname k8s-master01.local
```
### Set local DNS 
Edit file /etc/hosts
```sh
# Use the private IP address of the EC2 instance to map host file.
172.31.47.31  k8s-master01.local
172.31.47.32  k8s-worker01.local
172.31.47.33  k8s-worker02.local
```
### Disable Swap 
```sh
swapoff -a; sed -i '/swap/d' /etc/fstab 
```
### Install Docker
```sh
# install docker packages
yum install -y yum-utils device-mapper-persistent-data lvm2 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
yum install -y docker-ce 
# restart docker service
systemctl enable --now docker 
```
### Remove config and restart container (to fix issue)
```sh
rm -rf  /etc/containerd/config.toml 
systemctl restart containerd 
```
### Add the Kubernetes repository to the Linux repository.
```sh
cat > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
```
### Install Kubernetes packages, including Kubelet, kubeadm, and kubectl.
```sh
dnf install -y kubeadm
```
### Enable Kubelet service 
```sh
systemctl enable --now kubelet
```
### Initialize Kubernetes Cluster 
```sh
# Initialize kubernetes cluster
kubeadm init --apiserver-advertise-address=172.31.47.31 --pod-network-cidr=192.168.0.0/16
```
To start using your cluster, you need to run the following as a regular user
```sh
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
```

### Deploy Calico Network 
```sh
kubectl create -f https://docs.projectcalico.org/manifests/calico.yaml
```
Waiting for 5 minutes for the control plane to be ready
### Create K8S join command
```sh
kubeadm token create --print-join-command 
```


## 2) Data Plane Installation
> [!NOTE]
> These instruction is apply for worker node (k8s-worker01, k8s-worker02)

### Disable selinux 
```sh
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
```
### Set time zone
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
### Set hostname replace xx for your server name
```sh
hostnamectl set-hostname k8s-workerxx.local
```
### Set local DNS 
Edit file /etc/hosts
```sh
# Use the private IP address of the EC2 instance to map host file.
172.31.47.31  k8s-master01.local
172.31.47.32  k8s-worker01.local
172.31.47.33  k8s-worker02.local
```
### Disable Swap 
```sh
swapoff -a; sed -i '/swap/d' /etc/fstab 
```
### Install Docker
```sh
# install docker packages
dnf install -y yum-utils device-mapper-persistent-data lvm2 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
dnf install -y docker-ce 
# restart docker service
systemctl enable --now docker 
```
### Remove config and restart container (to fix issue)
```sh
rm -rf  /etc/containerd/config.toml 
systemctl restart containerd 
```
### Add the Kubernetes repository to the Linux repository.
```sh
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF 
```
### Install Kubernetes packages, including Kubelet, kubeadm, and kubectl.
```sh
dnf install -y kubeadm
```
### Enable Kubelet service 
```sh
systemctl enable --now kubelet
```
### Join worker node to kubernetes cluster (this is example, check command on master node)
```sh
kubeadm join k8s-master01.local:6443 --token dw3d4j.dqe6m0rewrhzh5k4 --discovery-token-ca-cert-hash sha256:a9babf7f033fd6979b1ba89ff44c7dfe43f28ea2fbe1949fce5efccc511c465b
```

## Verify
Now you can verify that all nodes ready (run this command on master node).
```sh
kubectl get nodes
```
The response should be like this
```sh
NAME                 STATUS   ROLES           AGE   VERSION
k8s-master01.local   Ready    control-plane   36h   v1.28.2
k8s-worker01.local   Ready    <none>          36h   v1.28.2
k8s-worker02.local   Ready    <none>          36h   v1.28.2
```
