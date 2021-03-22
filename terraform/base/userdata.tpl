#cloud-config
---
ssh_pwauth: false
apt:
  sources:
    tailscale.list:
      source: deb https://pkgs.tailscale.com/stable/ubuntu focal main
      keyid: 2596A99EAAB33821893C0A79458CA832957F5868
    docker.list:
      source: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
packages: 
  - docker-ce
  - docker-ce-cli
  - tailscale
runcmd:
  - tailscale up -authkey ${tailscale_key}