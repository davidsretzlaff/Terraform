terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {
  type        = string
  default     = ""
  description = "Token da Digital Ocean"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "vm-web"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  lifecycle {
    precondition {
      condition = var.region == "nyc1" || var.region == "nyc3"
      error_message = "The region need to be NYC1 or NYC3"
    }
  }
}

variable "region" {
    default = "nyc1"
}