/* DERIVED --------------------------------------*/
provider "digitalocean" {
  token             = var.digitalocean_token
  spaces_access_id  = var.digitalocean_spaces_id
  spaces_secret_key = var.digitalocean_spaces_key
}

provider "cloudflare" {
  email      = var.cloudflare_email
  api_key    = var.cloudflare_token
  account_id = var.cloudflare_account
}

/* DATA -----------------------------------------*/

terraform {
  backend "consul" {
    address = "https://consul.statusim.net:8400"
    /* Lock to avoid syncing issues */
    lock    = true
    /* KV store has a limit of 512KB */
    gzip = true
    /* WARNING This needs to be changed for every repo. */
    path      = "terraform/starterpack/"
    ca_file   = "ansible/files/consul-ca.crt"
    cert_file = "ansible/files/consul-client.crt"
    key_file  = "ansible/files/consul-client.key"
  }
}

/* CF Zones ------------------------------------*/

/* CloudFlare Zone IDs required for records */
data "cloudflare_zones" "active" {
  filter { status = "active" }
}

/* For easier access to zone ID by domain name */
locals {
  zones = {
    for zone in data.cloudflare_zones.active.zones:
      zone.name => zone.id
  }
}
