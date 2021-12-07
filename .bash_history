sudo apt update && sudo apt install -y docker.io && sudo systemctl enable docker.service && sudo apt install -y apt-transport-https curl ca-certificates
sudo mkdir /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
clear
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet=1.21.5-00 kubeadm=1.21.5-00 kubectl=1.21.5-00
sudo kubeadm init
echo kubeadm join 10.240.0.11:6443 --token p8s5es.05ydezilwhfgsrio         --discovery-token-ca-cert-hash sha256:863697032c5e62ae78bf24140cd2
d539b0718bb71b7c265d197cd7a95c64b3cf
echo "kubeadm join 10.240.0.11:6443 --token p8s5es.05ydezilwhfgsrio \
        --discovery-token-ca-cert-hash sha256:863697032c5e62ae78bf24140cd2
d539b0718bb71b7c265d197cd7a95c64b3cf"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get no
kubectl version
kubeadm version
kubelet version
kubelet -v
kubelet --version
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
history | grep echo
clear
kubectl get no
clear
kubectl get no
apt update
apt-cache madison kubeadm
clear
kubectl create deploy nginx --image=nginx --replicas=10
kubectl create deploy deploy-test --image=nginx --replicas=10
k get deploy
kubectl get deploy -o wide
kubectl get po -o wide
kubectl get po -o wide -n kube-system
clear
sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm=1.22.0-00 && sudo apt-mark hold kubeadm
kubeadm version
kubeadm upgrade plan
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply v1.22.2
sudo kubeadm upgrade apply v1.22.0
kubectl get po -o wide -n kube-system
kubectl get no 
kubectl drain master-node --ignore-daemonsets --force
sudo apt-mark unhold kubelet kubectl && sudo apt-get update && sudo apt-get install -y kubelet=1.22.0-00 kubectl=1.22.0-00 && sudo apt-mark hold kubelet kubectl
sudo systemctl daemon-reload
sudo systemctl restart kubelet
kubectl uncordon  master-node
kubectl get no
kubectl get po -n kube-system
clear
kubectl get node
kubectl drain workernode-0 --ignore-daemonsets --force
kubectl get po -o wide
kubectl get nodes
kubectl uncordon  workernode-0
kubectl get nodes
kubect get po -o wide
kubectl get po -o wide
kubectl get nodes
clear
kubectl drain workernode-1 --ignore-daemonsets --force
kubectl get nodes
kubectl get po -o wide
clear
kubectl uncordon  workernode-1
kubectl get nodes
clear
kubectl get no
sudo update
sudo apt update
apt-cache madison kubeadm
clear
.5.7-00 | https://apt.kubernetes.io kubernetes-xenial/main amd64 Packages
sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm=1.22.1-00 && sudo apt-mark hold kubeadm
kubeadm version
sudo kubeadm upgrade plan
sudo kubeadm upgrade apply v1.22.1
kubectl drain master-node --ignore-daemonsets --force
sudo apt-mark unhold kubelet kubectl && sudo apt-get update && sudo apt-get install -y kubelet=1.22.1-00 kubectl=1.22.1-00 && sudo apt-mark hold kubelet kubectl
sudo systemctl daemon-reload
sudo systemctl restart kubelet
kubectl uncordon master-node
kubectl get no
kubectl drain workernode-0 --ignore-daemonsets --force
kubectl get no
kubectl get po -o wide
kubectl uncordon workernode-0
kubectl get node
kubectl drain workernode-1 --ignore-daemonsets --force
kubectl get no
kubectl uncordon workernode-1
kubectl get no 
clear
openssl genrsa -out myuser.key 2048
ls
rm myuser.crt  myuser.csr  myuser.key myuser.yml
ls
openssl genrsa -out kate.key 2048
ls
openssl req -new -key myuser.key -out kate.csr
openssl req -new -key kate.key out kate.csr
ls
openssl req -new -key kate.key -out kate.csr
ls
cat kate.csr 
cat myuser.csr | base64 | tr -d "\n"
cat kate.csr | base64 | tr -d "\n"
clear
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: kate
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2lqQ0NBWElDQVFBd1JURUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRVM1JoZEdVeApJVEFmQmdOVkJBb01HRWx1ZEdWeWJtVjBJRmRwWkdkcGRITWdVSFI1SUV4MFpEQ0NBU0l3RFFZSktvWklodmNOCkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFKSExKcE9JRXlrM0FKMkovcEwyYmN3UDBYNTBiYVBlM2VTclVzakwKaktMckhZSE45dVlBZzJDMGJQeUNsZWU3N3VZc2lxb3N2Z1JTUHRYM0IzbTN5cE02ZE8rWk5GczhLa3hWZTNwawowSkV5Qlp4VTBMWmFxN1RSOWlzNXc2U3dTRTBoNGk2bmtpMnc4eFBaWFVkQmt6bzIyYUV1VnJZUUphMGJwQkQrCldsaS9aYlB4cnIvaW9LSzZNN3FXNTVKbkd5eFUvS1FkdWJZV3VSNnlWUVNXQmF0Vjc4SlkzOGR2dSt4WndtaWMKRzFNKzZORnhTUHFIUk5yQ01GSUtEbDNjc2tSaXZMbjk5dHBnU1VYaGc3YUhmSTExK0EvNTY4QjNYWE9ZQ2l6VApTMmFGVmViaG5MY2xJSGdGV04zTmVOUjE0UVUxajkzSi9tQTFNNlhvaUtrZGJHRUNBd0VBQWFBQU1BMEdDU3FHClNJYjNEUUVCQ3dVQUE0SUJBUUFMdGV1YkdzNyt5M3pPYno1TGRZcmJoRkRWcVVuckV6emZRcW5hci9reWV0Q2gKMWh5di9BNXIzVDNSbklDMXVDeGxRL1dZQkFkUnlvS3d4OEVkNXNOV3F4UjBpWkxmajY2WG4wbE5OY3lZUVhwUApDZ3UvQ1ZxUFhFLzNNcWhFM3dpNEtSaG8zMUNucEZ2bkw2NkExWE01MlQzcU9IWHNKNFJOeVZNU0MyYWN5eGJ0CnhlTTBFMGdKSnUwMU9aZGpqVzFtVUhPdjYrNFpBazM4NHVIU1Y4NzNOeDAyVms0Z25LUml0THlyRm1TSkw0d0oKRXVMRjE2NkZCZ2xob1RSRkp1UEp2eHpZVzZXRWJHOXlZcHJkVUZtbjhVVUFQUjB5S1VPcUlwWXNESXJyTFl1KwpBVklDUmFxRmdhc1FzNGtMeU5ZOTFZK0VWTmNoc1dPK1A5TTRERjh0Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF

ls
kubectl get csr
kubectl certificate approve kate
kubectl get csr
kubectl get csr/kate
kubectl get csr/kate -o yaml
clear
kubectl config view
kubectl config set-credentials kate --client-key=kate.key --client-certificate=kate.crt --embed-certs=true
history
cat kate.csr | base64 | tr -d "\n"
kubectl config set-credentials kate --client-key=kate.key --client-certificate=kate.crt --embed-certs=true
ls
kubectl get csr
kubectl config set-credentials kate --client-key=kate.key --client-certificate=kate.crt --embed-certs=true
ls
kubectl get csr kate -o jsonpath='{.status.certificate}'| base64 -d > kate.crt
kubectl config set-credentials kate --client-key=kate.key --client-certificate=kate.crt --embed-certs=true
kubectl config view
clear
kubectl get csr
openssl genrsa -out newuser.key 2048
ls
openssl req -new -key newuser.key -out newuser.csr
ls
cat newuser.csr | base64 | tr -d "\n"
expr 10*10
expr 10 * 10
clear
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2lqQ0NBWElDQVFBd1JURUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRVM1JoZEdVeApJVEFmQmdOVkJBb01HRWx1ZEdWeWJtVjBJRmRwWkdkcGRITWdVSFI1SUV4MFpEQ0NBU0l3RFFZSktvWklodmNOCkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFKZlM3emUveWJmTDZrRXUwTHh2YkdmZmFIM3RmMmZqamZvazMwR1IKampGdkR4ek1CNXIxRTlIWXRjQU9SM29WVTF3WFBLZkUrVWx0bHMrVDRxQ05XeTMwWkVXSUZzbFNIUmdkSDBFdAoxTmhqbXgyMmcvbnVMSmd1SU1JV2F1VWE2R282dEdXRUlSTG5qSXpxTUNFK2lQdUwyS3FEVnFadGkzSVNEQStmCmFoTG4xRmU2QUFhVW5qUTNYSktWMU1EaVBjUWVTZTJsVzhzbDRITWxWUG9oTXBUNTRDVmRaS3VTa1FOaUliKzEKZDE4T2gyemY1cU05VWFQY0V3NjJoam9va2Z1UndFMWhDZ284VUdsOElxUVhTRkYwd2hJUEdFcGNaTFNHZTcyTwpqc1pHaDF6aW5CcU53MnpERkMra0pBN0dCaFRPbVVzMkUvZjNBckowOHUvaS8xTUNBd0VBQWFBQU1BMEdDU3FHClNJYjNEUUVCQ3dVQUE0SUJBUUNPV25TemQxemdDWjVqT1FnYUlUb2UvYXR0bWRXSzhOVDdsZUt1eDBGWkpXb1YKWGFaMkQvMjhWYUU1NzJ2M3F6T2ZaeFN0cFpoMWVoMHFuUjdQbW11Q1ZuZkxTU2x0MDZ0a2VxR2RWQ0laOFpMRwpELzMvMzBzL25ieWdDVFpMZitLSzBhL3ZsYTNaQWl6b1JtdFJnRWlOLzJZTzhycmNIZzFvS1RwZnk5MlpOMWtFClVGeXpPbEh2OHh6eTZpdWd4TWtHZS9ITm00N0I2MjdLVEE1R0VsWnZ1NnlqM0FmMUdCblByOTFrTUI2SFV1ZkEKaE1Pbk1FR3RqcHBCVldPdlh4SHBWTVZaOCs4TU5SRUtUdUc3dTI1S0hYbUFRYUVCSjlNTlpzeCtnVi8vc2pNUQpHNDQ3a3k0SkVGd3BSY2xmeTVHMWJ6VnlPOS9wa0VoRTZYdDUzSDVNCi0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF

kubectl get csr
kubectl certificate approve newuser
kubectl get csr
kubectl get csr newuser -o jsonpath='{.status.certificate}'| base64 -d > newuser.crt
ls
kubectl create role developer --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods,deployments,secrets,services
kubectl create role developer1 --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods,deployments,secrets,services
kubectl create rolebinding developer1-binding-newuser --role=developer1 --user=newuser
kubectl describe role developer1
kubectl describe rolebinding
clear
kubectl config set-credentials newuser --client-key=newuser.key --client-certificate=newuser.crt --embed-certs=true
kubectl config view
kubectl config set-context newuser --cluster=kubernetes --user=newuser
kubectl config view
kubectl config --help
kubectl config current-context
kubectl config use-context newuser
kubectl get po
kubectl get ns
kubectl get deploy
kubectl config use-context kubernetes-admin@kubernetes
kubectl get deploy
kubectl auth can-i list deploy --as newuser
kubectl auth can-i list deploy --as myuser
kubectl auth can-i list po --as myuser
kubectl config use-context myuser
kubectl get po
sudo kubectl get po
kubectl config view
clear
ls
openssl x509 -noout -dates -in newuser.crt
kubectl config use-context newuser
kubectl config current-context
kubectl et po
kubectl get po
sudo systemctl restart kubelet
sudo systemctl restart kubectl
sudo systemctl status kubectl
kubectl get po
sudo useradd newuser
su - newuser
sudo passwd newuser
su - newuser
clear
kubectl get po
ls -al
vi .kube/config
clear
kubectl config use-context newuser
kubectl config use-context kubernetes-admin@kubernetes
kubectl get po
cat /etc/kubernetes/admin.conf
sudo cat /etc/kubernetes/admin.conf
clear
kubectl config view
clear
openssl genrsa -out newuser1.key 2048
openssl req -new -key newuser1.key -out newuser1.csr -subj "/CN=newuser1/O=admin"
ls
openssl genrsa -out new.key 2048
openssl req -new -key new.key -out new.csr
clear
cat newuser1.csr | base64 | tr -d "\n"
clear
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser1
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2FEQ0NBVkFDQVFBd0l6RVJNQThHQTFVRUF3d0libVYzZFhObGNqRXhEakFNQmdOVkJBb01CV0ZrYldsdQpNSUl
CSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQTRVMUJjRVJuOEhOUHBmSHJQYkJyCmxyK0JTL2xBcnNFN1FCNXJ4QmlvL3FtaHBMcW1Rc05xcGYraEJCeEhxNk
RINHU0RDVmNDdYWUc5K3NCQnhUQmYKL0pJWFlNV0NIZVh3YWlvTE80eHZKOGI2ZU1CSVNhU3hiWWZZYkNWSWRsVEJ3c3V0Y2Z3RUJTZ2FPMGJUQXVBQgpGeEtiTnFndWMvdnFOUEtJZ
G5xYVJzNDJIT0ZxNnU1UkRyY2grWkFyZXdOMUlRV1IwSk1nY2RqbGIxVU9sNVZ4CnVPWmtIeDlPNUg0anNXdUE1aU15Qjc5MDBINFR1N0VLRVdTaDlNVTU0SHdKclV4bUhaaEJPb3la
MzNMdngwNmkKQ2dVTzNxeXdudUFnOUR4cmhPbmxyREhhdkYzdE9XVWdLVG9vVEpoV1REL0tlZ3pUb09Vd1UzN2czYVk5b2hBRwpmUUlEQVFBQm9BQXdEUVlKS29aSWh2Y05BUUVMQlF
BRGdnRUJBRHlaSGdtdXYxNVVXV205aDY5MDYxa0dXWDdMCk5Qd2psOXFIclpBNzlNWGhNTi91cU01aml3S05rUTlKMWxpNUZsS0U0WDFMNElRbU1nYVhzUE1TQ05VamRiQnoKMlJsTV
hrWTNMNlErMko2OEg2ZVB0dXppckxmVGpGeS8yei8yMGQ4VnpISkUvTjJKWXlqbEI0SHA3bUlId3Z1SwpnNGlYWTRLSUpPWVovblFqdzZJTkpBTzlRQjNUV2cwRE9la05objRYd2RiN
DNmMTlNeHZ1OEdFT21WTTlVVWF6ClJrTGJ0OGd1aFlGcVkvcmV1ZDVQNzZwZkx0VjMwcmZrZE9Ha3FsMkVvcXhxTW11aXh0MGt6SWNFVlFhQmYrTSsKVWVtVjh3QjNLOUQxbHFGRmZ1
N3VFOWtwKzVjRHorZ3Q5cjRqVXI1eVNLUDBHb2k4ZlR4d0o2K1Bjd1U9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 1186400  # one day
  usages:
  - client auth
EOF

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser1
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2FEQ0NBVkFDQVFBd0l6RVJNQThHQTFVRUF3d0libVYzZFhObGNqRXhEakFNQmdOVkJBb01CV0ZrYldsdQpNSUl
CSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQTRVMUJjRVJuOEhOUHBmSHJQYkJyCmxyK0JTL2xBcnNFN1FCNXJ4QmlvL3FtaHBMcW1Rc05xcGYraEJCeEhxNk
RINHU0RDVmNDdYWUc5K3NCQnhUQmYKL0pJWFlNV0NIZVh3YWlvTE80eHZKOGI2ZU1CSVNhU3hiWWZZYkNWSWRsVEJ3c3V0Y2Z3RUJTZ2FPMGJUQXVBQgpGeEtiTnFndWMvdnFOUEtJZ
G5xYVJzNDJIT0ZxNnU1UkRyY2grWkFyZXdOMUlRV1IwSk1nY2RqbGIxVU9sNVZ4CnVPWmtIeDlPNUg0anNXdUE1aU15Qjc5MDBINFR1N0VLRVdTaDlNVTU0SHdKclV4bUhaaEJPb3la
MzNMdngwNmkKQ2dVTzNxeXdudUFnOUR4cmhPbmxyREhhdkYzdE9XVWdLVG9vVEpoV1REL0tlZ3pUb09Vd1UzN2czYVk5b2hBRwpmUUlEQVFBQm9BQXdEUVlKS29aSWh2Y05BUUVMQlF
BRGdnRUJBRHlaSGdtdXYxNVVXV205aDY5MDYxa0dXWDdMCk5Qd2psOXFIclpBNzlNWGhNTi91cU01aml3S05rUTlKMWxpNUZsS0U0WDFMNElRbU1nYVhzUE1TQ05VamRiQnoKMlJsTV
hrWTNMNlErMko2OEg2ZVB0dXppckxmVGpGeS8yei8yMGQ4VnpISkUvTjJKWXlqbEI0SHA3bUlId3Z1SwpnNGlYWTRLSUpPWVovblFqdzZJTkpBTzlRQjNUV2cwRE9la05objRYd2RiN
DNmMTlNeHZ1OEdFT21WTTlVVWF6ClJrTGJ0OGd1aFlGcVkvcmV1ZDVQNzZwZkx0VjMwcmZrZE9Ha3FsMkVvcXhxTW11aXh0MGt6SWNFVlFhQmYrTSsKVWVtVjh3QjNLOUQxbHFGRmZ1
N3VFOWtwKzVjRHorZ3Q5cjRqVXI1eVNLUDBHb2k4ZlR4d0o2K1Bjd1U9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 1186400  # one day
  usages:
  - client auth
EOF

cat newuser1.csr | base64 | tr -d "\n"
clear
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser1
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2FEQ0NBVkFDQVFBd0l6RVJNQThHQTFVRUF3d0libVYzZFhObGNqRXhEakFNQmdOVkJBb01CV0ZrYldsdQpNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQTRVMUJjRVJuOEhOUHBmSHJQYkJyCmxyK0JTL2xBcnNFN1FCNXJ4QmlvL3FtaHBMcW1Rc05xcGYraEJCeEhxNkRINHU0RDVmNDdYWUc5K3NCQnhUQmYKL0pJWFlNV0NIZVh3YWlvTE80eHZKOGI2ZU1CSVNhU3hiWWZZYkNWSWRsVEJ3c3V0Y2Z3RUJTZ2FPMGJUQXVBQgpGeEtiTnFndWMvdnFOUEtJZG5xYVJzNDJIT0ZxNnU1UkRyY2grWkFyZXdOMUlRV1IwSk1nY2RqbGIxVU9sNVZ4CnVPWmtIeDlPNUg0anNXdUE1aU15Qjc5MDBINFR1N0VLRVdTaDlNVTU0SHdKclV4bUhaaEJPb3laMzNMdngwNmkKQ2dVTzNxeXdudUFnOUR4cmhPbmxyREhhdkYzdE9XVWdLVG9vVEpoV1REL0tlZ3pUb09Vd1UzN2czYVk5b2hBRwpmUUlEQVFBQm9BQXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRHlaSGdtdXYxNVVXV205aDY5MDYxa0dXWDdMCk5Qd2psOXFIclpBNzlNWGhNTi91cU01aml3S05rUTlKMWxpNUZsS0U0WDFMNElRbU1nYVhzUE1TQ05VamRiQnoKMlJsTVhrWTNMNlErMko2OEg2ZVB0dXppckxmVGpGeS8yei8yMGQ4VnpISkUvTjJKWXlqbEI0SHA3bUlId3Z1SwpnNGlYWTRLSUpPWVovblFqdzZJTkpBTzlRQjNUV2cwRE9la05objRYd2RiNDNmMTlNeHZ1OEdFT21WTTlVVWF6ClJrTGJ0OGd1aFlGcVkvcmV1ZDVQNzZwZkx0VjMwcmZrZE9Ha3FsMkVvcXhxTW11aXh0MGt6SWNFVlFhQmYrTSsKVWVtVjh3QjNLOUQxbHFGRmZ1N3VFOWtwKzVjRHorZ3Q5cjRqVXI1eVNLUDBHb2k4ZlR4d0o2K1Bjd1U9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 1186400  # one day
  usages:
  - client auth
EOF

ls
kubectl get csr
kubectl certificate approve newuser1
kubectl get csr/newuser1 -o yaml
kubectl get csr newuser1 -o jsonpath='{.status.certificate}'| base64 -d > newuser1.crt
openssl x509 -noout -dates -in newuser1.crt
kubectl create role developer1 --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods,deployments,secrets,services
kubectl create role developer2 --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods,deployments,secrets,services
kubectl create rolebinding developer2-binding-newuser1 --role=developer2 --user=newuser1
kubectl config set-credentials newuser1 --client-key=newuser1.key --client-certificate=newuser1.crt --embed-certs=true
kubectl config view
kubectl config use-context newuser1
kubectl config set-context newuser1 --cluster=kubernetes --user=newuser1
kubectl config use-context newuser1
kubectl get po
kubectl get ns
kubectl get cm
kubectl get secrets
kubectl get rs
kubectl get deploy
ls
kubectl config view
kubectl config set context kubernetes-admin@kubernetes
kubectl config --help
kubectl config set-context kubernetes-admin@kubernetes
clear
ls
openssl genrsa -out newuser2.key 2048
openssl req -new -key newuser2.key -out newuser2.csr
ls
cat newuser2.csr | base64 | tr -d "\n"
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser2
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2lqQ0NBWElDQVFBd1JURUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRVM1JoZEdVeApEakFNQmdOVkJBb01CV0ZrYldsdU1SRXdEd1lEVlFRRERBaHVaWGQxYzJWeU1qQ0NBU0l3RFFZSktvWklodmNOCkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFQRm5mL3NTelpYRTVRcVhVaHVudWpkVzVqaXBsNDREUk5aeVp6WHoKS1VuU245TDV1OGxveUhxalNmL3IrSlR0TzNiZE1hZVdTMEFpZ09hcWpvLzJ1c3hxc0N6bFp6Vm45V1p6bVdWbQo5dlZiRHJSbXg5R1JucXZ3Qm1yZm9YSVlGbWZCN09nY2pjMnZoMkg2cVJ5dlRzRGZaTWpzaFpqQVVGcEo3UHlKCjZKM2NoemdpRm9Yd011cVdTL1drMVo1a0o5aVdSZTA3Y3NzbGc5Z3g4c2tkRnFYNXUzSitBSHRNWUs0dENza1AKcTZRbTFUZzZtVitMT2crNS9uU29OWWhJOWNhT3A3Z0pCL3NhbzhGb3ZrTnlWRTJFaW5LS2xmNWZIbW16ZGFjbwpSWmxIbEJhM3dnM3EwYXZ2K1lFblRTZHF6anVDSkRoQzByY3ZaYjdzZ2pybHdBMENBd0VBQWFBQU1BMEdDU3FHClNJYjNEUUVCQ3dVQUE0SUJBUUI3NzIzSTdFblBsLzNSZ0xFeFo4ZDJraFhEM08ySzgvWlpXb1JOdTZDbzRBTWUKVG0wUExlTHJvNmRpaFlpMUpla2t0a2ljYlNMdmhLbTd0RnBmVER1dzk0T2Z4V3JUbzMrM3ZndFVzQnpyRjJKQQp0aTZoWkZLT2NqUFlrVEh0OEt2ZEZsUUxFTFRNVGt1My9WRitvTzJzbko3Y01RaFlYZjV2UEkwSHNEeFUzOUlUCmxUdzZQRWxubEltQ1oyVlZpcFhaUFM1Zm5tZXVyVzQycUNxSkRzUjU2S3BVdlJkczFGSCtWK1E0dlE5Y0g1djIKQ2tWUElpeC80VVhlb084WS9jb0xCeXFCU1lkZjgrQTUxaTlab0RHZTZhYWtaaEFIeGJ5UzFxVEdVbXVuTndQagpOMDd4U1ZqUW5mN2Rlc0FuYmhUd0tCUGpYbmNKdXl4RUpJbTlWeE1RCi0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 1186400  # one day
  usages:
  - client auth
EOF

kubectl get csr
kubectl config view
kubectl config use-context kubernetes-admin@kubernetes
kubectl config view
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: newuser2
spec:
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ2lqQ0NBWElDQVFBd1JURUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRVM1JoZEdVeApEakFNQmdOVkJBb01CV0ZrYldsdU1SRXdEd1lEVlFRRERBaHVaWGQxYzJWeU1qQ0NBU0l3RFFZSktvWklodmNOCkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQkFQRm5mL3NTelpYRTVRcVhVaHVudWpkVzVqaXBsNDREUk5aeVp6WHoKS1VuU245TDV1OGxveUhxalNmL3IrSlR0TzNiZE1hZVdTMEFpZ09hcWpvLzJ1c3hxc0N6bFp6Vm45V1p6bVdWbQo5dlZiRHJSbXg5R1JucXZ3Qm1yZm9YSVlGbWZCN09nY2pjMnZoMkg2cVJ5dlRzRGZaTWpzaFpqQVVGcEo3UHlKCjZKM2NoemdpRm9Yd011cVdTL1drMVo1a0o5aVdSZTA3Y3NzbGc5Z3g4c2tkRnFYNXUzSitBSHRNWUs0dENza1AKcTZRbTFUZzZtVitMT2crNS9uU29OWWhJOWNhT3A3Z0pCL3NhbzhGb3ZrTnlWRTJFaW5LS2xmNWZIbW16ZGFjbwpSWmxIbEJhM3dnM3EwYXZ2K1lFblRTZHF6anVDSkRoQzByY3ZaYjdzZ2pybHdBMENBd0VBQWFBQU1BMEdDU3FHClNJYjNEUUVCQ3dVQUE0SUJBUUI3NzIzSTdFblBsLzNSZ0xFeFo4ZDJraFhEM08ySzgvWlpXb1JOdTZDbzRBTWUKVG0wUExlTHJvNmRpaFlpMUpla2t0a2ljYlNMdmhLbTd0RnBmVER1dzk0T2Z4V3JUbzMrM3ZndFVzQnpyRjJKQQp0aTZoWkZLT2NqUFlrVEh0OEt2ZEZsUUxFTFRNVGt1My9WRitvTzJzbko3Y01RaFlYZjV2UEkwSHNEeFUzOUlUCmxUdzZQRWxubEltQ1oyVlZpcFhaUFM1Zm5tZXVyVzQycUNxSkRzUjU2S3BVdlJkczFGSCtWK1E0dlE5Y0g1djIKQ2tWUElpeC80VVhlb084WS9jb0xCeXFCU1lkZjgrQTUxaTlab0RHZTZhYWtaaEFIeGJ5UzFxVEdVbXVuTndQagpOMDd4U1ZqUW5mN2Rlc0FuYmhUd0tCUGpYbmNKdXl4RUpJbTlWeE1RCi0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 1186400  # one day
  usages:
  - client auth
EOF

kubectl certificate approve newuser2
kubectl get csr newuser2 -o jsonpath='{.status.certificate}'| base64 -d > newuser2.crt
openssl x509 -noout -dates -in newuser2.crt
clear
kubectl create role developer3 --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods,deployments,secrets,services
kubectl create rolebinding developer3-binding-newuser2 --role=developer3 --user=newuser2
kubectl config set-credentials newuser2 --client-key=newuser2.key --client-certificate=newuser2.crt --embed-certs=true
kubectl config set-context newuser2 --cluster=kubernetes --user=newuser2
kubectl config view
kubectl config use-context newuser2
kubectl get po
kubectl get ns
kubectl get secrets
kubectl get cm
kubectl config use-context kubernetes-admin@kubernetes
clear
kubectl create clusterrolebinding cluster-admin-binding   --clusterrole cluster-admin   --user $(gcloud config get-value account)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/cloud/deploy.yaml
kubectl get all -A
kubectl describe service/ingress-nginx-controller -n ingress-nginx
kubectl get all -A
clear
kubectl get all -A
kubectl get clusterrolebindings
kubectl get clusterrolebindings cluster-admin-binding -o yaml
kubectl edit clusterrolebindings cluster-admin-binding
kubectl get clusterrolebindings cluster-admin-binding -o yaml
kubectl get all -A[B
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/cloud/deploy.yaml
kubectl get all -A
kubectl get clusterrolebindings cluster-admin-binding -o yaml
kubectl delete clusterrolebindings cluster-admin-binding
kubectl create clusterrolebinding cluster-admin-binding   --clusterrole cluster-admin   --user $(kaoutarbentahar@gmail.com)
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin \
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(kaoutarbentahar@gmail.com)
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user kaoutarbentahar@gmail.com
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/cloud/deploy.yaml
kubectl get all -A
kubectl describe service -n ingress-nginx ingress-nginx
kubectl cluster-info dump | grep LoadBalancer
grep -r cloud-provider= /etc/kubernetes/manifests
sudo grep -r cloud-provider= /etc/kubernetes/manifests
cd etc/kubernetes/manifests
cd /etc/kubernetes/manifests
ls -al
clear
vi init.yml
kubectl apply -f init.yml 
kubectl get po
kubectl describe pod/myapp-pod 
kubectl get po
cleatr
clear
kubectl get all -help
kubectl get all --help
kubectl get all -A --selector k8s-app=kube-dns
kubectl get all -A --selector k8s-app=kube-dns --show-labels
clear
vi pv.yml
vi pv1.yml
ls
vi pv-m.yml
kubectl explain pv 
kubectl explain pv  | grep hostPath
kubectl apply -f pv-m.yml 
kubectl get pv-mergen
kubectl get pv pv-mergen
vi pvc-m.yml
kubectl apply -f pvc-m.yml 
kubectl create ns myvol
kubectl apply -f pvc-m.yml 
kubectl get persistentvolumeclaim/mergen-claim 
kubectl get persistentvolumeclaim/mergen-claim  -n myvol
vi po-m.yml
kubectl apply -f po-m.yml 
kubectl describe po pv-pod
kubectl describe po pv-pod -n myvol
clear
kubectl get ns
kubectl delete ns mynamespace
kubectl delete ns myvol
clear
kubectl run latest-po --image=alpine:latest --command sleep 3600 --restart=OnFailure -n mynamespace
kubectl create ns mynamespace 
kubectl run latest-po --image=alpine:latest --command sleep 3600 --restart=OnFailure -n mynamespace
kubectl get po
kubectl get deploy
kubectl delete deploy deploy-test --force
kubectl delete deploy nginx --force
kubectl get po
kubectl get po -n mynamespace
kubectl describe po latest-po -n mynamespace
clear
vi init.yml
rm init.yml 
vi init.yml
kubectl apply -f init.yml 
kubectl describe pod/init-po
kubectl get po
clear
ls
rm pv.yml pv1.yml pvc.yml pv-m.yml po-m.yml
rm pv.yml pv1.yml pvc-m.yml pv-m.yml po-m.yml
rm pv.yml
ls
mkdir practtice
rm practtice
rmkdir practtice
rmdir practtice
ls
mkdir practice
ls
cd practice/
clear
vi pv.yml
kubectl create ns myvol
vi pvc.yml
kubectl apply -f pv
kubectl apply -f pv.yml 
vi pv.yml
kubectl apply -f pv.yml 
kubectl apply -f pvc.yml 
kubectl get pv
kubectl get pvc
kubectl get pvc -n myvol
vi po-pvtest.yml
rm po-pvtest.yml
vi pv-pod.yml
kubectl apply -f pv-pod.yml 
kubectl describe pod/pv-pod -n myvol
clear
kubectl get po -n run-once
kubectl describe po xxazz-pod -n run-once
clear
kubectl delete po xxazz-pod -n run-once
kubectl get ns
kubectl run xxazz-pod --image=alpine --command sleep 3600 --restart=Never -n run-once
kubectl get po -n run-once
clear
kubectl create deploy nginx-deploy --image=nginx:1.14 --record=true
kubectl create deploy nginx-deploy --image=nginx:1.14 --record
kubectl create deploy nginx-deploy --image=nginx:1.14 
kubectl get deply
kubectl get deploy
kubectl delete deploy nginx-deploy --force
kubectl create deploy nginx-deploy --image=nginx:1.14 
kubectl set image deploy nginx-deploy --nginx=nginx:latest --record=true
kubectl set image deploy nginx-deploy nginx=nginx:latest --record=true
kubectl describe deploy nginx-deploy 
kubectl rollout undo deploy nginx-deploy 
kubectl describe deploy nginx-deploy 
clear
kubectl rollout --help
clear
kubectl get all -A --selector=k8s-app=kube-dns --show-labels
kubectl get all -A --selector=k8s-app=kube-dns 
clear
kubectl create cm --from-literal=myuser=mypassword
kubectl create cm cm-k --from-literal=myuser=mypassword
kubectl get m
kubectl get cm
vi conf-po.yml
kubectl get po
vi conf-po.yml
kubectl apply -f conf-po.yml 
kubectl describe po conf-pod
kubectl exec -it pod conf-pod -- /bin/bash
kubectl exec -it conf-pod -- /bin/bash
vi conf-po.yml
kubectl exec -it conf-pod -- /bin/sh
clear
kubectl get po
kubectl get no
kubectl get po -o wide
kubectl drain workernode-1
kubectl get po -o wide
kubectl drain workernode-1
kubectl drain workernode-1 --ignore-daemonsets
kubectl drain --help
kubectl get po -o wide
kubectl drain no workernode-1  --ignore-daemonsets
kubectl drain workernode-1  --ignore-daemonsets
kubectl drain workernode-1  --ignore-daemonsets --force
kubectl get po -o wide
kubectl get po
kubectl describe po conf-pod
clear
kubectl uncordon workernode-1
kubectl get nodes
kubectl get po -o wide
kubectl run po-bb --image=nginx
kubectl get po -o wide
kubectl get po
kubectl delete po conf-pod --force
kubectl get po
ls
vi conf-po.yml 
kubectl apply -f conf-po.yml 
kubectl describe pod/conf-pod
kubectl exec -it conf-pod -- /bin/sh
kubectl exec -it conf-pod -- /bin/bash
kubectl get po
ls
vi conf-po.yml 
kubectl describe po conf-pod
kubectl logs conf-pod
kubectl delete pod conf-pod --force
ls
vi conf-po.yml 
kubectl apply -f conf-po.yml 
kubectl exec -it conf-pod -- /bin/bash
kubectl exec -it conf-pod -- /bin/sh
kubectl get po
clear
kubectl get ds
kubectl get ds -A
kubectl create ds everywhere
kubectl create ds-h
kubectl create ds -h
clear
kubectl create deploy ds-everywhere --image=nginx --dry-run=client -o yaml > ds.yml
vi ds.yml 
kubectl apply -f ds.yml 
vi ds.yml 
kubectl apply -f ds.yml 
vi ds.yml 
kubectl apply -f ds.yml 
vi ds.yml 
clear
cd practice/
ls
vi ds.yml 
kubectl get ds
kubectl apply -f ds.yml 
vi ds.yml 
kubectl apply -f ds.yml 
kubectl get po -n kube-system
kubectl describe pod etcd-master-node -n kube-system
clear
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save /var/exam/etcd-backup
sudo apt install etcd-client
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save /var/exam/etcd-backup
ls
ls -al
cd
ls -al
cd .
ls
clear
cd practice/
ls
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save /var/exam/etcd-backup
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save $HOME/var/exam/etcd-backup
mkdir ~/var
ls
mkdir ~/var/exam
mkdir ~/var/exam/etcd-backup
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save $HOME/var/exam/etcd-backup
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save /var/exam/etcd-backup
history
kubectl describe pod etcd-master-node -n kube-system
clear
kubectl run busy33 --image=busybox --command sleep 3600 
kubectl expose pod busy33 --port=80 
kubectl get svc 
kubectl describe svc busy33
kubectl describe pod busy33
kubectl get svc 
kubectl get pod -o wide
kubectl describe svc busy33
kubectl run busybox33 --image=busybox --rm -it --restart=Never -- nslookup busy33
kubectl delete svc busy33
kubectl expose pod busy33 --port=80 
history
kubectl get pod -o wide
history | grep busy33
kubectl run busybox33 --image=busybox --rm -it --restart=Never -- nslookup 10-36-0-4.default.pod
kubectl delete po busybox33
kubectl run busybox33 --image=busybox --rm -it --restart=Never -- nslookup 10-36-0-4.default.pod
kubectl delete po busybox33
ps aux | grep etcd
sudo ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save etcdback
sudo ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save /var/exam/etcd-backup
sudo ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot save $HOME/var/exam/etcd-backup
cd /var/exam/etcd-backup
cd ~/var/exam/etcd-backup
ls
ls
ls =al
ls -al
cd ~
pwd
cd ..
ls -al
cd ..
ls -al
cd var
ls
cd ~
ls
clear
ls =al
ls -al
pwd
cd ..
ls 
cd ~
pwd
clear
cd var
cd exam
cd etcd-backup/
ls
ls -al
cd ~/practice/
ls
sudo ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key   snapshot status etcdback
cp etcdback  /var/exam/etcd-back
cp etcdback  /var/exam/etcd-backup
cp etcdback  ~/var/exam/etcd-backup
ls  ~/var/exam/etcd-backup
cat etcdback 
vi etcdback 
kubectl get po
kubectl get svc
kubectl get po -o wide
history | grep busy33
kubectl run busybox33 --image=busybox --rm -it --restart=Never -- nslookup busy33
clear
cd practice/
ls
kubectl get po
kubectl delete po busy33 busybox33 conf-pod
kubectl delete po init-po po-bb
clear
kubectl get po
kubectl run nginx-po --image=nginx
kubectl get po -o wide
kubectl get po --show-labels
kubectl get ns
kubectl create ns secure
clear
kubectl run busybox-po --image=busybox --command sleep 3600 -n secure
kubectl get po -n secure
kubectl get po 
clear
kubectl get po -n secure --show-labels 
kubectl get po nginx-po --show-labels
vi netpol
rm netpol
vi netpol.yml
kubectl apply -f netpol.yml 
kubectl exec -it busybox-po -- /bin/bash
kubectl exec -it busybox-po -- /bin/sh
kubectl get po -n secure --show-labels 
sudo kubectl  exec -it busy-box-po -- /bin/sh
clear
ls
cd practice/
ls
kubectl create ns mynamespace
kubectl get ns
kubectl run po nginx --image=nginx --namespace=mynamespace -o yaml > test.yml
vi test.yml 
kubectl apply -f test.yml 
clear
rm test.yml 
kubectl run po nginx --image=nginx --namespace=mynamespace --dry-run=client -o yaml > test.yml
vi test.yml 
kubectl apply -f test.yml 
rm test.yml 
kubectl run nginx --image=nginx --namespace=mynamespace --dry-run=client -o yaml > test.yml
kubectl apply -f test.yml 
kubectl get po
kubectl get po -n mynamespace
vi test.yml 
kubectl delete po po 
kubectl run busybox --image=busybox --command -- env --restart=Never --dry-run=client -o yaml > envpod.yml
vi envpod.yml 
kubectl get po
clear
kubectl logs busybox
kubectl apply -f envpod.yaml
kubectl create ns myns -o yaml > myns.yml
vi myns.yml 
kubectl run po-ex --image=nginx 
kubectl expose po po-ex --name=svc-ex --port=80
kubectl describe svc svc-ex
clear
kubectl delete po  po-ex
kubectl delete svc svc-ex
kubectl run nginx --image=nginx --restart=Never --port=80
kubectl describe pod/nginx
clear
kubectl delete pod/nginx
kubectl run nginx --image=nginx --restart=Never --port=80
kubectl set image pod/nginx nginx=nginx:1.7.1
kubectl describe po nginx
clear
v
kubectl get po nginx -w
kubectl get po nginx -o jsonpath='{.spec.containers[].image}{"\n"}'
clear
ps aux | grep etcd
ps -o ppid= -p 6765
ps aux | grep 6663
kubectl get po -n kube-system 
clear
kubectl describe po etcd-master-node -n kube-system
clear
cd /etc/kubernetes/manifests/
ls
cat etcd.yaml 
sudo cat etcd.yaml 
cler
clear
openssl x509  -noout -text -in /etc/kubernetes/pki/etcd/server.crt
clear
cd
clear
kubectl run busybox --image=busybox --restart=Never -o yaml --dry-run=client -- /bin/sh -c 'echo hello;sleep 3600' > pod.yaml
vi pod.yaml 
kubectl apply f pod.yaml 
kubectl apply -f pod.yaml 
vi pod.yaml 
kubectl apply -f pod.yaml 
vi pod.yaml 
kubectl apply -f pod.yaml 
vi pod.yaml 
kubectl apply -f pod.yaml 
vi pod.yaml 
clear
kubectl run pod-nginx --image=nginx --port=80 --dry-run=client -o yaml > nginx.yml
vi nginx.yml 
kubectl apply -f nginx.yml 
vi nginx.yml 
kubectl run box-test --image=busybox --restart=Never -it --rm -- /bin/sh -c "wget -O- IP"
clear
kubectl run nginx1 --image=nginx --restart=Never --labels app=v1
kubectl run nginx2 --image=nginx --restart=Never --labels app=v1
kubectl run nginx3 --image=nginx --restart=Never --labels app=v1
kubectl get po
kubectl get po --show-labels
clear
kubectl get po nginx2 --dry-run=client -o yaml > edit.yml
kubectl get po nginx2 -o yaml > edit.yml
vi edit.yml 
kubectl delete po nginx2 --force
vi edit.yml 
kubectl apply -f edit.yml 
kubectl get po --show-labels
kubectl get po -L app
clear
kubectl get po -L app=v2
kubectl get po --selector=app=v2
kubectl label po nginx1 nginx2 nginx3 app-
kubectl get po --show-labels
kubectl delete po nginx1 nginx2 nginx3
clear
kubectl get po
kubectl deletepo nginx-po
kubectl delete po nginx-po
clear
kubectl create deploy ngnx --image=nginx:1.18.0 --replicas=2 --port=80
kubectl get deploy
kubectl delete deploy ngnx
kubectl create deploy nginx --image=nginx:1.18.0 --replicas=2 --port=80
kubectl get deploy
kubectl get deploy nginx -o yaml
clear
kubectl get rs
kubectl get rs nginx-67dfd6c8f9 -o yaml
clear
kubectl get po
kubectl get po nginx-67dfd6c8f9-4zck9 -o yaml
clear
kubectl rollout status deply nginx
kubectl rollout status deploy nginx
kubectl set image deploy nginx nginx=nginx:1.19.8 --record=true
kubectl rollout hisytory deploy nginx
kubectl rollout history deploy nginx
kubectl get rs
clear
kubectl rollout undo deploy nginx
kubectl describe deploy nginx
clear
kubectl set image deploy nginx nginx=nginx1.91 --record=true
kubectl rollout status deploy nginx
clear
kubectl get po
kubectl rollout history deploy nginx
kubectl rollout undo deploy nginx --to-revision=2
clear
kubectl describe deploy nginx | grep Image:
kubectl rollout status deploy nginx
kubectl rollout history deploy nginx
kubectl rollout history deploy nginx --revision=4
clear
kubectl scale deploy nginx --replicas=5
kubectll get deploy nginx 
kubectl get deploy nginx
kubectl delete deploy nginx
kubectl get rs
kubectl get po
clear
kubectl get po
clear
kubectl create cm config --from-literal=foo=lala --from-literal=foo2=lolo
kubectl get cm
kubectl describe cm config
kubectl delte cm cm-k myuser
kubectl delete cm cm-k myuser
kubectl get cm config -o yaml
clear
echo -e "foo3=lili\nfoo4=lele" > config.txt
cat config.txt 
kubectl create cm cm2 --from-file=config.txt
kubectl get cm
kubectl describe cm cm2
echo -e "var1=val1\n# this is a comment\n\nvar2=val2\n#anothercomment" > config.env
cat config.env 
kubectl create cm cm3 --from-env-file=config.env
clear
kubectl create cm options --from-literal=var5=val5
kubectl describe configmap/options
kubectl run nginx-po --image=nginx --dry-run=client -o yaml > cm.yml
vi cm.yml 
kubectl apply -f cm.yml
kubectl exec -it nginx-po --env
kubectl exec -it nginx-po --env | grep option
kubectl exec -it nginx-po -- /bin/bash 
clear
kubectl get po
kubectl delete po all
kubectl delete po nginx-po
clear
kubectl get cm
kubectl delete cm cm2 cm3
kubectl create cm anotherone --from-literal=var6=val6 --from-literal=var7=val7
kubectl run nginx-po --image=nginx --dry-run=client -o yaml > another.yml
vi another.yml 
kubectl apply -an
kubectl apply -f another.yml 
kubectl describe pod/nginx-po
kubectl exec nginx-po -it -- /bin/bash
clear
kubectl create cm cmvolume --fromliteral=var8=val8 --from-literal=var9=val9
kubectl create cm cmvolume --from-literal=var8=val8 --from-literal=var9=val9
kubectl describe cm  cmvolume
ls
rm pod.yaml 
kubectl run nginx --image=nginx --restart=Never -o yaml --dry-run=client > pod.yaml
vi pod.yaml
kubectl apply -f pod.yaml 
cd /etc/lal
kubectl apply -f pod.yaml 
vi po
rm po
vi pod.yaml 
kubectl apply -f pod.yaml 
clear
kubectl run userID --image=nginx --dry-run=client -o yaml > user-id.yml
vi user-id.yml 
kubectl run nginx --image=nginx --restart=Never --dry-run=client -o yaml | kubectl set resources -f - --requests=cpu=100m,memory=256Mi --limits=cpu=200m,memory=512Mi --local -o yaml > nginx-pod.yml
vi nginx-pod.yml 
kubectl create -f nginx-pod.yml 
kubectl get po
kubectl delete nginx-po
kubectl delete po nginx-po
kubectl create secret mysecret --from-literal=password=mypass
kubectl create secret --help
clear
kubectl create secret generic mysecret --from-literal=password=mypass
kubectl get secret
kubectl describe secret mysecret
clear
echo -n admin > username
ls
kubectl create secret generic mysecret2 --from-file=username
kubectl get secret
kubectl describe secret mysecret2
kubectl get secret mysecret2 -o yaml
clear
kubectl get secret mysecret2 -o yaml
echo -n YWRtaW4= | base64 -d
kubectl get secret mysecret2 -o yaml
echo -n YWRtaW4= | base64 -d # on MAC it is -D, which decodes the value and shows 'admin'
echo -n YWRtaW4= | base64 -d > user
cat user
ls
cat user
cd user
clear
cd user
clear
kubectl get secret mysecret2 -o jsonpath='{.data.username}' | base64 -d  # on MAC it is -D
sudo kubectl get secret mysecret2 -o jsonpath='{.data.username}' | base64 -d  # on MAC it is -D
vi user-id.yml 
kubectl create -f user
kubectl create -f user-id.yml 
vi user-id.yml 
kubectl create -f user-id.yml 
kubectl exec -it nginx /bin/bash
kubectl exec -it user -- /bin/bash
clear
kubectl get po
kubectl delete po user
vi user-id.yml 
kubectl apply -f user-id.yml 
kubectl exec -it user -- /bin/bash
clear
kubectl exec -it user -- env
kubectl create -f pod.yaml
kubectl exec -it nginx -- env | grep USERNAME | cut -d '=' -f 2 # will show 'admin'
clear
kubectl get svc --all-namespaces
kubectl get sa --all-namespaces
clear
kubectl create sa myuser
kubectl run sa-po --image=nginx -o yaml > sa.yml
vi sa.yml 
rm sa
rm sa.yml 
kubectl run sa-po --image=nginx --dry-run=client -o yaml > sa.yml
vi sa.yml 
kubectl apply -f sa.yml 
vi sa.yml 
kubectl apply -f sa.yml 
vi sa.yml 
kubectl apply -f sa.yml 
vi sa.yml 
vi sa.yml clear
clear
kubectl apply -f sa.yml 
vi sa.yml 
kubectl apply -f sa.yml 
clear
vi sa.yml 
kubectl apply -f sa.yml 
Wq
clear
kubectl run nginx --image=nginx --restart=Never --serviceaccount=myuser -o yaml --dry-run=client > pod.yaml
kubectl apply -f pod.yaml
clear
kubectl get po
kubectl delete po sa-po nginx user busybox
kubectl get po
kubectl get deploy
kubectl delete deploy nginx-deploy
clear
kubectl get po
kubectl get ds 
kubectl delete ds ds-everywhere
clear
kubectl run expose-me --image=nginx --port=80
kubectl get po
kubectl describe po expose-me
clear
kubectl describe po expose-me
clear
kubectl get svc expose-me
kubectl get svc
kubectl delete svc busy33
clear
kubectl get po
kubectl delete po expose-me
clear
kubectl run expose-me --image=nginx --restart=Never
kubectl expose po expose-me --name=svc-exp --port=80
kubectl get svc
kubectl describe svc svc-exp
kubectl get po -o wide
kubectl run temp --image=busybox --command sleep 3600 
kubectl get po -o wide
clear
kubectl get po -o wide
kubectl exec -it temp -- /bin/sh
clear
kubectl get svc 
kubectl get svc svc-exp -o yaml > svc-exp.yml
vi svc-exp.yml 
kubectl delete svc svc-exp 
kubectl apply -f svc-exp.yml 
vi svc-exp.yml 
kubectl apply -f svc-exp.yml 
kubectl describe service/svc-exp
kubectl exec -it temp -- /bin/sh
clear
kubectl get po -o wde
kubectl get po -o wide
kubectl get svc
kubectl exec -it temp -- /bin/sh
clear
kubectl get po -o wide
kubectl describe svc svc-exp
kubectl exec -it temp -- /bin/sh
clear
kubectl create deploy foo --image=dgkanatsios/simpleapp --replicas=3 --label=app=foo --port=8080
kubectl create deploy foo --image=dgkanatsios/simpleapp --replicas=3 --label app=foo --port=8080
kubectl create deploy foo --image=dgkanatsios/simpleapp --replicas=3 --labels app=foo --port=8080
kubectl create deploy foo --image=dgkanatsios/simpleapp --replicas=3 --port=8080
kubectl label deploy foo app=foo
kubectl label  --help
clear
kubectl label deploy foo --overwrite app=foo
kubectl get po -o wide
kubectl run testing --image=busybox --command sleep 3600 --restart=Never
kubectl exec testing -it -- /bin/bash
kubectl delete pod/testing
kubectl run testing --image=busybox --command sleep 3600 
kubectl exec testing -it -- /bin/bash
kubectl delete pod/testing
kubectl run busybox --image=busybox --restart=Never -it --rm -- sh
cle
kubectl get po -o wide
clear
kubectl get po -o wide
kubectl run busybox --image=busybox --restart=Never -it --rm -- sh
wget -O- POD_IP:8080
kubectl delete po busybox
kubectl run busybox --image=busybox --restart=Never -it --rm -- sh
kubectl get po -o wide
kubectl delete po busybox
kubectl run busybox --image=busybox --restart=Never -it --rm -- sh
wget -O- POD_IP:8080
kubectl run busybox --image=busybox --restart=Never -it --rm -- sh
kubectl get deploy
kubectl expose deploy foo --name=svc-foo --port=6262
kubectl describe service/svc-foo
kubectl get svc
kubectl get ep svc-foo
clear
kubectl describe service/svc-foo
kubectl get po 
kubectl delete po temp --force
clear
kubectl run temp --image=busybox -it --rm --restart=Never -- sh 
clear
kubectl get po
kubectl delete po temp
clear
kubectl get svc-foo
clear
kubectl get  svc svc-foo
clear
kubectl describe svc svc-foo
kubectl run tem --image=busybox -it --rm --restart=Never -- sh
clear
kubectl create deploy access --image=nginx --replicas=2 
kubectl expose deploy access --port=80
kubectl get svc
kubectl describe svc access
kubectl get svc access -o yaml
clear
vi policy.yml
kubectl get po -o wide
kubectl get po --show-labels
vi policy.yml
kubectl apply -f policy.yml 
kubectl describe networkpolicy.networking.k8s.io/test-network-policy
clear
kubectl run busybox --image=busybox --rm -it --restart=Never --labels=access=granted -- wget -O- http://nginx:80 --timeout 2
kubectl delete busybox --force
kubectl delete po busybox --force
kubectl run busybox --image=busybox --rm -it --restart=Never --labels=access=granted -- wget -O- http://nginx:80 --timeout 2
clear
kubectl get po
kubectl delete deploy access foo
kubectl delete po tem expose-me
kubectl get po
clear
kubectl run multi-po --image=busybox --command sleep 3600 -- /bin/sh -c -o yaml > multi.yml
vi multi.yml 
kubectl get po
kubectl run multi-po --image=busybox --command sleep 3600 -0 yaml > multi.yml 
kubectl delete po multi-po
kubectl run multi-po --image=busybox --command sleep 3600 -o yaml > multi.yml  
vi multi.yml 
rm multi.yml 
kubectl run multi-po --image=busybox --command sleep 3600 --dry-run=client -o yaml > multi.yml   
vi multi.yml 
kubectl apply -f multi.yml 
wq
clear
vi multi.yml 
kubectl apply -f multi.yml 
wqclear
clear
vi multi.yml 
kubectl apply -f multi.yml 
clear
vi multi.yml 
kubectl apply -f multi.yml 
kubectl exec -it busybox -c busybox2 -- /bin/sh
kubectl exec -it busybox -c busybox -- /bin/sh
kubectl clear
clear
kubectl exec -it busybox -c busybox -- /bin/sh
kubectl exec -it busybox -c busybox -- /bin/sh mount | grep foo
kubectl exec -it busybox -c busybox -- /bin/sh
kubectl delete po busybox
clear
ls
vi pod.yaml 
kubectl run busybox --image=busybox --restart=Never -o yaml --dry-run=client -- /bin/sh -c 'sleep 3600' > multi-po.yml
vi multi-po.yml 
kubectl get po
kubectl delete po multi-po
kubectl delete po multi-po --force
kubectl get po
clear
kubectl apply -f multi
kubectl apply -f multi-po.yml 
kubectl get po
kubectl describe po busybox
clear
kubectl exec -it busybox -c busybox2 -- /bin/sh
clear
ls
vi pv.yml
kubectl apply -f pv.yml 
kubectl get pv
vi pvc.yml
kubectl apply -f pvc.yml 
kubectl get pvc
kubectl get pv
clear
kubectl run busybox-pv --image=busybox --command sleep 3600 --dry-run=client -o yaml > po-pv.yml
vi po-pv.yml 
kubectl apply -f po-pv.yml 
vi po-pv.yml 
kubectl apply -f po-pv.yml 
kubectl exec -it busybox-pv -- /bin/sh
vi po-pv.yml 
kubectl apply -f po-pv.yml 
kubectl exec -it busybox-pv1 -- /bin/sh
clear
kubectl run busybox --image=busybox --restart=Never -- sleep 3600
kubectl run busybox-1 --image=busybox --restart=Never -- sleep 3600
kubectl cp busybox-1:etc/passwd ./passwd
ls
cat passwd
clear
kubectl get po
kubectl delete po busybox-1 busybox-pv busybox-pv1
kubectl exec -it busybox -c busybox2 -- /bin/sh
clear
kubectl exec -it busybox -c busybox -- /bin/sh
clear
kubectl create deploy expose-me --image=nginx --replicas=2 
kubectl expose deploy expose-me --name=expose-it --port=80
kubectl get svc 
kubectl delete svc access svc-exp svc-foo --force
clear
kubectl describe svc expose-it 
kubectl get po -o wide
rm policy.yml 
vi policy.yml
kubectl get po --show-labels
vi policy.yml
kubectl run test --image=busybox --rm -it --restart=Never --labels=access=granted -- wget -O- http://expose-me:80 --timeout 2
clear
kubectl run test --image=busybox --rm -it --restart=Never --labels=access=granted -- wget -O- 10.100.145.123:80 --timeout 2
kubectl run test --image=busybox --rm -it --restart=Never --labels=access=granted -- wget -O- expose-it:80 --timeout 2
exit
clear
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
alias k=kubectl
complete -F __start_kubectl k
k get pod
k delete pod busybox 
k delete  deployments.apps  expose-me 
clear
kubectl config get-contexts 
k config  view 
clear
kubectl config get-contexts 
kubectl config get-contexts  > /opt/course/1/contexts
k get nodes -o wide
k describe node master-node 
clear
k run pod1 --image=httpd:2.4.41-alpine --dry-run=client -o yaml > pod1.yml
vi pod1.yml 
kubectl apply -f pod1.yml 
k get po -o wide 
k delete po pod1
vi pod1.yml 
kubectl apply -f pod1.yml 
k get po -o wide 
k delete po pod1
vi pod1.yml 
kubectl apply -f pod1.yml 
k get po -o wide 
kubectl apply -f pod1.yml 
k get po -o wide 
clear
k get pod
k delete pod pod1
clear
k create deploy scale-me --image=nginx --replicas=4
k scale deployment scale-me --replicas=2 --record=true
k rollout history deployment scale-me 
k describe  deployments.apps scale-me 
clear
k rollout undo deployment scale-me --record=true
kubectl rollout undo --help
clear
k rollout undo deployment scale-me 
clear
k get deployments.apps 
k delete deployments.apps scale-me 
clear
k get pod
kubectl get pod -A --sort-by=.metadata.uid
clear
ls
rm pv.yml pvc.yml po-pv.yml
ls
clear
vi pv.yml
k apply -f pv.yml 
kubectl get pv
vi pvc.yml
k apply -f pvc.yml 
k create ns project-tiger
k apply -f pvc.yml 
k get pv
k get pvc
k get pvc safari-pvc
k get pvc safari-pvc -n project-tiger
clear
k create deployment safari -n project-tiger --image=httpd:2.4.41-alpine --dry-run=client -o yaml > deploy-pv.yml
vi deploy-pv.yml 
k apply -f deploy-pv.yml 
vi deploy-pv.yml 
k apply -f deploy-pv.yml 
vi deploy-pv.yml 
k top node 
k top  pod 
clear
k get po -n kube-system 
ps -aux | grep kubelet
find /etc/systemd/system/ | grep kube
celar
clear
k get nodes 
k get pod -n kube-system
cd /etc/kubernetes/manifests/
ls
mv kube-scheduler.yaml ..
sudo mv kube-scheduler.yaml ..
ls
cd ..
cd
cd ..
ls
clear
ls
cd kaoutarbentahar/
ls
clear
cd /etc/kubernetes/manifests/
ls
k get pod -n kube-system
k get pod -n kube-system | grep schedule
cd
k run manual-schedule --image=httpd:2.4-alpine
k get po
k get po -o wide
k get pod manual-schedule -o yaml > 9.yaml
vi 9.yaml 
k replace -f 9.yaml --force 
k get po -o wide
clear
cd /etc/kubernetes/manifests/
mv ../kube-scheduler.yaml 
ls
mv --hellp
mv --help
clear
cd ..
ls
mv kube-scheduler.yaml  manifests/
cp kube-scheduler.yaml  manifests/
sudo cp kube-scheduler.yaml  manifests/
cd manifests/
la
cd 
kubectl get po -n kube-system 
clear
k run manual-schedule2 --image=httpd:2.4-alpine
k get pod -o wide
k get pod -o wide | grep schedule
kubectl get po -n kube-system
clear
k create sa processor -n project-hamster
k create ns project-hamster
k create sa processor -n project-hamster
k create role processor --resource=secret,configmap --verb=create --namespace=project-hamster 
k describe role processor -n project-hamster 
k create rolebinding processor --role=processor --serviceaccount=project-hamster:processor
k describe rolebinding processor
k auth can-i create secret --as-processor -n project-hamster
clear
kubectl auth can-i --help
clear
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
alias k=kubectl
complete -F __start_kubectl k
c
clear
kubectl config get-contexts
kubectl config get-contexts > /opt/course/1/contexts
cp kubectl config get-contexts > /opt/course/1/contexts
kubectl config get-contexts -o name > /opt/course/1/contexts
k config view -o jsonpath="{.contexts[*].name}" | tr " " "\n" > /opt/course/1/contexts
cat ~/.kube/config | grep current
clear
kubectl get no
kubectl describe no master-node | grep -i taint
kubectl run pod1-container --image=httpd:2.4.41-alpine --dry-run=client -o yaml > schedule.yml
vi schedule.yml 
kubectl apply -f schedule.yml 
kubectl get po -o wide
k delete po pod1-container --force
vi schedule.yml 
kubectl apply -f schedule.yml 
kubectl get po -o wide
k delete po pod1-container --force
clear
kubectl get pods -A
kubectl get pod -A --sort-by=.metadata.creationTimestamp
clear
k get po
kubectlget po --sort-by=metadata.creationTimestamp
clear
kubectl get pod -A --sort-by=.metadata.creationTimestamp
kubectl get pod -A --sort-by=.metadata.uid
clear
safari-pv.yml
vi safari-pv.yml
kubectl apply -f sa
kubectl apply -f safari-pv.yml 
vi safari-pv.yml
kubectl apply -f safari-pv.yml 
vi safari-pv.yml
kubectl get no
cd /etc/kubernetes/manifests/
ls
mv kube-scheduler.yaml ..
sudo mv kube-scheduler.yaml ..
ls
cd..
cd 
cd /etc/kubernetes/
ls
cd
clear
kubectl -n kube-system get pod
clear
k run manual-schedule --image=httpd:2.4-alpine
kubectl run manual-schedule --image=httpd:2.4-alpine
kubectl get po
kubectl get pod manual-schedule  -o yaml > 9.yml
vi 9.yml
kubectl delete po manual-schedule --force
kubect apply -f 9.yml
kubectl apply -f 9.yml
kubectl  get po
kubectl  get po -o wide
clear
cd /etc/kubernetes/manifests/
ls
mv ../kube-scheduler.yaml .
cd ..
ls
mv kube-scheduler.yaml manifests
sudo mv kube-scheduler.yaml manifests
cd manifests/
ls
clear
kubectl get sa
kubectl create sa processor
kubectl delete --force serviceaccount/processor
kubectl create sa processor -n project-hamster
kubectl get ns
kubectl delete ns project-hamster --force
clear
kubectl delete ns project-hamster --force
kubectl get ns
kubectl delete ns project-tiger --force
clear
kubectl create sa processor -n project-hamster
kubectl create ns project-hamster
clear
kubectl create role processor --resource=secrets,configmaps --verb=create --namespace=project-hamster
kubectl create rolebinding processor --role=processor --user=serviceaccount --namespace=project-hamster
k -n project-hamster auth can-i create secret   --as system:serviceaccount:project-hamster:processor
kubectl -n project-hamster auth can-i create secret   --as system:serviceaccount:project-hamster:processor
kubectl -n project-hamster auth can-i create secrets --as system:serviceaccount:project-hamster:processor
file:///C:/Users/kevse/OneDrive/Desktop/CKA%20Mock%20Tests/Killer%20Shell%20-%20CKS%20CKA%20CKAD%20Simulator.html#:~:text=k%20-n%20project-hamster%20auth%20can-i%20create%20pod,--as%20system%3Aserviceaccount%3Aproject-hamster%3Aprocessor
clear
kubectl get ns
kubectl create ns project-tiger
vi deploy.yml
ls
clear
kubectl run multi-container-playground --image=nginx:1.17.6-alpine --dry-run=client -o yaml > m1.yml
vi m1.yml 
kubectl apply -f m1.yml 
vi m1.yml 
kubectl apply -f m1.yml 
kubectl describe pod/multi-container-playground
clear
kubectl logs multi-container-playground
kubectl logs multi-container-playground -c c3
kubectl get po
clear
kubectl get po
kubectl delete po multi-container-playground
kubectl api-resources
kubectl api-resources -h
kubectl api-resources --namecpaced
kubectl api-resources --namespaced
clear
kubectl get ns
kubectl run tigers-reunite --image= httpd:2.4.41-alpine --dry-run=client -o yaml > p1.yml
kubectl run tigers-reunite --image=httpd:2.4.41-alpine --dry-run=client -o yaml > p1.yml
vi p1.yml 
kubectl apply -f p1.yml 
kubect get po
kubectl get po -o yaml
kubectl get po -o wide
clear
whereis kubelet
service kubelet status
ps aux | grep kubelet
clear
service kubelet status
cclear
clear
cd /usr/local/bin/kubelet
whereis kubelet
cd /usr/bin/kubelet
vi /usr/bin/kubelet
vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
cd /etc/systemd/system
ls
cd kubelet.service.d/
ls
vi 10-kubeadm.conf 
clear
cd
kubectl get ns
kubectl create ns secret
ls
pwd
git --version
clear
git help
clear
git config --global user.name "kaoutarBen11"
git config --global user.password "kaoutarablghazi98"
git config --list
mkdir my-git
cd my-git/
git init
git status
nano ka.bt
git add
git add .
git commit -m "added ka.bt"
git config --global user.name "kaoutarBen11"
git config --global user.email kaoutarbentahar@gmail.com
git add .
git config --global user.password "kaoutarablghazi98"
git add .
git commit --amend --reset-author
clear
git remote add origin  git@github.com:kaoutarBen11/cka-1.git
git push -u origin master
clear
sudo apt-get install git -y
git --version
git config --global user.name "kaoutarBen11"
git config --global user.email "kaoutarbentahar@gmail.com"
git config --list
pwd
ls
ls -al
ls -al | grep -i con
gedit .gitconfig
apt  install gedit
sudo apt  install gedit
gedit .gitconfig
sudo gedit .gitconfig
clear
git push -u origin master
ls
cd my-git/
git push -u origin master
sudo git push -u origin master
clear
git remote add origin git@github.com:kaoutarBen11/cka-1.git
git branch -M main
git push -u origin main
sudo git remote add origin git@github.com:kaoutarBen11/cka-1.git
git status
clear
ls
cd my-git/
ls
git status
touch test.yml
ls
git status
git init
git config list
git config -list
git config --list
git remote add origin git@github.com:kaoutarBen11/cka-1.git
git commit .
git commit all
git commit *
git commit test.yml
git push -u origin main
cd ..
mkdir git
cd git
touch test.yml
ls
echo "# cka-2" >> README.md
git init
git add README.md 
git add test.yml 
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:kaoutarBen11/cka-2.git
git push -u origin main
ls -al ~/.ssh
git config --list
ssh-keygen -t rsa -b 4096 -C "kaoutarbentahar@gmail.com"
ls -al ~/.ssh
ssh-add ~/.ssh/id_rsa
sudo ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
cat id_rsa.pub
cat ~/.ssh/id_rsa.pub
clear
ls
cd my-git/
git status
git add .
git commit -m "test commit"
git status
git branch -M main
git remote add origin git@github.com:kaoutarBen11/cka-1.git
git push -u origin main
git status
