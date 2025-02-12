#1
terraform {
  required_version = "~>1.0" // aceitar versões acima de 1
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean" // specifying the source, which is DigitalOcean
      version = "~> 2.0" // accepts versions above 2.0 as long as they are minor updates due to ~>
      // I could use >2 to accept everything above 2
      // == 2 (exactly version 2)
      // != 2.0 (not version 2.0)
    }
  }
}

# 2
# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "dop_v1_32b63616c1c47813bb73d0b69512ee13352741bfdb5544c54fafba2fb08879c7" // token created on provider
}

# 3
# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "vm_aula" { // segundo label é nome que voce quer dar ao do resource
  image   = "ubuntu-22-04-x64"
  name    = "vm-aula2"
  region  = "nyc1"
  size    = "s-1vcpu-512mb-10gb" // link slugs.do-api.dev
}

