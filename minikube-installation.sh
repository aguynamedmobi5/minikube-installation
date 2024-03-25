#!/bin/bash

# checks if the script is running with sudo privilege or not.
if [ $EUID -ne 0 ] 
then
    echo "Run this script as root"
    exit 1
fi

# Kubectl Installation & Setup
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#Docker Installation
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#Adding user to docker group
usermod -aG docker ubuntu

#Installing Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube

