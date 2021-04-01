terraform {
  required_version = "~> 0.14.4"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = " = 2.10.1"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = " = 2.5.1"
    }
    pass = {
      source  = "camptocamp/pass"
      version = " = 2.0.0"
    }
  }
}
