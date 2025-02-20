terraform {
  required_version = "~>1.0" 
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean" 
      version = "~> 2.0"      
    }
  }
}

//criando mais de uma maquina
resource "digitalocean_droplet" "vm_aula" { 
  image    = "ubuntu-22-04-x64"
  name     = "${var.droplet_name}-${count.index}"
  region   = var.droplet_region
  size     = var.droplet_size               
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
  count = var.vms_count
}

resource "digitalocean_firewall" "firewall_aula" {
  name = "firewall-aula"

  droplet_ids = digitalocean_droplet.vm_aula[*].id

  inbound_rule {
    protocol   = "tcp"
    port_range = "22"    
    source_addresses = ["0.0.0.0/0", "::/0"] // aqui eu to liberando tudo
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "53" // pra fazer instalação dos pacotes
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

