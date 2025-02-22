terraform {
  required_version = "~>1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "vm_aula_provisioner" {
  image    = "ubuntu-22-04-x64"
  name     = "maquina-aula"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  provisioner "local-exec" {
    command = "echo Machine with IP ${self.ipv4_address} created" // command that will be executed
  }
}

variable "do_token" {}