terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}


provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  name     = "vm-labs-${count.index}"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-22-04-x64"
  region   = "nyc1"
  count = 2
  ssh_keys = [digitalocean_ssh_key.ssh.fingerprint]
}

# Create a new SSH key
resource "digitalocean_ssh_key" "ssh" {
  name       = "terraform-ssh-aula"
  public_key = file("~/.ssh/aula-terraform.pub")
}

output "ip" {
  value = digitalocean_droplet.web[*].ipv4_address
}