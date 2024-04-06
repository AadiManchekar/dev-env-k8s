FROM ubuntu:22.04

# Update the package repository and install necessary packages
RUN apt-get update && \
    apt-get install -y sudo

RUN sudo swapoff -a
RUN sudo sed -i '/ swap / s/^/#/' /etc/fstab

# Forwarding IPv4 and letting iptables see bridged traffic:
RUN sudo echo "overlay" >> /etc/modules-load.d/k8s.conf && sudo echo "br_netfilter" >> /etc/modules-load.d/k8s.conf
RUN sudo modprobe overlay && sudo modprobe br_netfilter

# sysctl params required by setup, params persist across reboots
RUN sudo echo "net.bridge.bridge-nf-call-iptables  = 1" >> /etc/sysctl.d/k8s.conf && sudo echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.d/k8s.conf && sudo echo "net.ipv4.ip_forward                 = 1" >> /etc/sysctl.d/k8s.conf

# Apply sysctl params without reboot
RUN sudo sysctl --system

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg

# Adding repository
RUN sudo install -m 0755 -d /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository to sources list
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN sudo apt-get update && sudo apt-get install -y kubelet=1.26.1-00 kubectl=1.26.1-00 kubeadm=1.26.1-00 && sudo apt-mark hold kubelet kubeadm kubectl
