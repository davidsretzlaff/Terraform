terraform {
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
//test