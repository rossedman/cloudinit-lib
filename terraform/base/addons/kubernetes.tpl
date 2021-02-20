#cloud-config
---
apt:
  sources:
    kubernetes.list:
      source: deb https://apt.kubernetes.io/ kubernetes-xenial main
      keyid: 59FE0256827269DC81578F928B57C5C2836F4BEB
packages:
  - cri-tools
  - kubeadm
  - kubectl
  - kubelet