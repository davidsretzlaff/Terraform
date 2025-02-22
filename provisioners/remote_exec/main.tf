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

data "digitalocean_ssh_key" "ssh" {
  name = "aula-terraform-no-pass"
}

resource "digitalocean_droplet" "vm_aula_provisioner" {
  image    = "ubuntu-22-04-x64"
  name     = "maquina-aula"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/aula-terraform-no-pass") 
    host        = digitalocean_droplet.vm_aula_provisioner.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install curl -y",
      "apt install nginx -y",
      "curl -fsSL https://get.docker.com | sh"
    ]
  }
}

variable "do_token" {}
