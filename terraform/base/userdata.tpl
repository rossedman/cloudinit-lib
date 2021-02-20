#cloud-config
---
ssh_pwauth: false
apt:
  sources:
    docker.list:
      source: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
    hashicorp.list:
      source: deb [arch=amd64] https://apt.releases.hashicorp.com focal main
      keyid: E8A032E094D8EB4EA189D270DA418C88A3219F7B
    kubernetes.list:
      source: deb https://apt.kubernetes.io/ kubernetes-xenial main
      keyid: 59FE0256827269DC81578F928B57C5C2836F4BEB
    tailscale.list:
      source: deb https://pkgs.tailscale.com/stable/ubuntu focal main
      keyid: 2596A99EAAB33821893C0A79458CA832957F5868
packages: 
  - docker-ce
  - docker-ce-cli
  - etcd
  - kubeadm
  - kubectl
  - kubelet
  - tailscale
  - terraform
  - zsh
  - vim
runcmd:
  - [tailscale, up, -authkey, ${tailscale_key}]