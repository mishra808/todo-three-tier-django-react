#!/bin/bash
source ./print_colors.sh

if command -v kubectl &> /dev/null; then
    print_yellow "kubectl is installed."
else
    ## Installing Kubectl
    sudo  apt-get update -y
    sudo snap install kubectl --classic
    kubectl version
    print_green "kubectl installed"
fi

if command -v eksctl &> /dev/null; then
    print_yellow "eksctl is installed."
else
    ## Installing eksctl
    sudo  apt-get update -y
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    eksctl version
    print_green "EKSCTL installed"
fi