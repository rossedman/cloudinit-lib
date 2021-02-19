#cloud-config
---
ssh_pwauth: false
users:
  - name: rossedman
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: docker,sudo
    lock_passwd: True
    #ssh_import_id: "gh:rossedman"
    shell: /usr/bin/zsh
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYq6FW4xmAmNg29ZUOWAC8rAmu/rqIR9Gyplp3gHzDAoERDCQaCuCcFeTPIdscx5lsCuNq5yRG2P9Us1UnfEELsg5suqjCGOm/lim36dSNw0jNjR8Uy0d6FNhLlEPqfF8TaZ2yCzPrdGIYIDH2/t3HKDEovYImz3/IFv5O5e8tKD8xX3/xmDPt8ZoouubgJcl9Csk1rJX22X4bQ4B/eMCH9L1OMnfKzlUt+dod5vdCciwvMnXHAwNRYKy85yEkCTCNXj4VM6XPa4gEmuzXHXxhygsL5FDAhkV60agMsWYbFZzyYZhWP7S9cyJSpagRO8rQoJ/cloybq9Gh65X/T+Jy24GocotIuLoyijU8PC8xg5iiUzl1YW1+U1kOWLn3Dj7xCROmGL4J0r9ioZ1J4Bxfyd+xM8w/YlISWtW1P3zg2/Abw6W9+3fy2UQXEN9/YahW7UgJ3O959RmeH8PSWMHAGVmw054T54JWdsa9qUO0N1xjQpNiFuLpVFp37mVv+/k=
apt:
  sources:
    docker.list:
      source: deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
      keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88
    tailscale.list:
      source: deb https://pkgs.tailscale.com/stable/ubuntu focal main
      keyid: 2596A99EAAB33821893C0A79458CA832957F5868
packages: 
  - docker-ce
  - docker-ce-cli
  - tailscale
  - zsh
  - vim
runcmd:
  - [tailscale, up, -authkey, ${tailscale_key}]