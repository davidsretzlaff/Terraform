#1
terraform {
  required_version = "~>1.0" // aceitar versões acima de 1
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean" // specifying the source, which is DigitalOcean
      version = "~> 2.0"                    // accepts versions above 2.0 as long as they are minor updates due to ~>
      // I could use >2 to accept everything above 2
      // == 2 (exactly version 2)
      // != 2.0 (not version 2.0)
    }
  }
}


# 3
# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "vm_aula" { // segundo label é nome que voce quer dar ao do resource
  image    = "ubuntu-22-04-x64"
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size                       // link slugs.do-api.dev
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id] //primeiro bloco é o data, segundo é nome, terceiro é o id
}

resource "digitalocean_firewall" "firewall_aula" {
  name = "firewall-aula"

  droplet_ids = [digitalocean_droplet.vm_aula.id]

  inbound_rule {
    protocol   = "tcp"
    port_range = "22"
    //source_addresses = ["192.168.1.0/24", "2002:1:2::/48"] // dessa forma eu estou restrigindo dizendo que só esse ip pode acessar
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

