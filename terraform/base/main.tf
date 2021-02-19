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
  name     = "homelab"
  region   = "nyc3"
  ip_range = "10.10.10.0/24"
}

resource "digitalocean_droplet" "toolbox" {
  name      = "toolbox-01"
  size      = "s-1vcpu-1gb"
  image     = "ubuntu-20-04-x64"
  region    = digitalocean_vpc.homelab.region
  vpc_uuid  = digitalocean_vpc.homelab.id
  user_data = templatefile("${path.module}/userdata.tpl", {
      tailscale_key = var.tailscale_key
  })
}

resource "digitalocean_project" "labscale" {
  name        = "labscale"
  description = "A project for scaling homelab with tailscale"
  resources   = [digitalocean_droplet.toolbox.urn]
}

output "ip" {
  value = digitalocean_droplet.toolbox.ipv4_address
}