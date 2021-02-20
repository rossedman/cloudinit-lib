
```
export DIGITALOCEAN_TOKEN=<TOKEN>
export TF_VAR_tailscale_key=<TAILSCALE_KEY>
terraform init terraform/base
terraform plan terraform/base
terraform apply terraform/base
```

### Resources

- https://cloudinit.readthedocs.io/en/latest/topics/examples.html
- https://github.com/lovelysystems/cloud-init/blob/master/doc/examples/cloud-config.txt
- https://gist.github.com/dylanwh/76cb122d12799930bbb7d2ec71f4b4fa