/* REQUIRED -------------------------------------*/

variable "cloudflare_token" {
  description = "Token for interacting with Cloudflare API."
}

variable "cloudflare_email" {
  description = "Email address of Cloudflare account."
}

variable "cloudflare_account" {
  description = "ID of CloudFlare Account."
}

variable "digitalocean_token" {
  description = "Token for interacting with DigitalOcean API."
}

variable "digitalocean_spaces_id" {
  description = "ID for access to DigitalOcean spaces API."
}

variable "digitalocean_spaces_key" {
  description = "Key for access to DigitalOcean spaces API."
}

/* GENERAL --------------------------------------*/

variable "public_domain" {
  description = "Domain under which the public sites go."
  default     = "status.im"
}

variable "domain" {
  description = "DNS Domain to update"
  default     = "statusim.net"
}
