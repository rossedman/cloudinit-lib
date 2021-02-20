#cloud-config
---
apt:
  sources:
    hashicorp.list:
      source: deb [arch=amd64] https://apt.releases.hashicorp.com focal main
      keyid: E8A032E094D8EB4EA189D270DA418C88A3219F7B
packages: 
  - consul
  - packer
  - nomad
  - terraform
  - vault