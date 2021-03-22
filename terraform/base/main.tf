terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

// export DIGITALOCEAN_TOKEN
provider "digitalocean" {
}

variable "tailscale_key" {
  type = "string"
}

resource "digitalocean_vpc" "homelab" {
  name     = "homelab2"
  region   = "nyc3"
  ip_range = "10.20.10.0/24"
}

resource "digitalocean_ssh_key" "default" {
  name       = "Labscale - Terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "server" {
  count     = 3
  name      = "server-${count.index}"
  size      = "s-1vcpu-1gb"
  image     = "ubuntu-20-04-x64"
  region    = digitalocean_vpc.homelab.region
  vpc_uuid  = digitalocean_vpc.homelab.id
  ssh_keys  = [digitalocean_ssh_key.default.fingerprint]
  user_data = templatefile("${path.module}/userdata.tpl", {
    tailscale_key = var.tailscale_key
  })
}

resource "digitalocean_project" "labscale" {
  name        = "labscale"
  description = "A project for scaling homelab with tailscale"
  resources   = digitalocean_droplet.server.*.urn
}

output "public_ip" {
  value = digitalocean_droplet.server.*.ipv4_address
}

output "private_ip" {
  value = digitalocean_droplet.server.*.ipv4_address_private 
}