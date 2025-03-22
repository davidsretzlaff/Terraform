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


resource "digitalocean_droplet" "example" {
  name   = "${var.droplet-name}-${terraform.workspace}"
  region = var.region
  size   = var.droplet-size
  image  = var.droplet-image
  count = var.droplet-count
}

variable "droplet-name" {
  type = string
}

variable "region" {
  type = string
}

variable "droplet-size" {
  type = string
}

variable "droplet-count" {
  type = number
}

variable "droplet-image" {
  type=string
}