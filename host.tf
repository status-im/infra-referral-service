/**
 * This is a dev machine for developing the Referral service.
 * https://github.com/status-im/referral-service
 **/

module "main" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 1
  env        = "referral"
  group      = "referral"
  size       = "s-4vcpu-8gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "main" {
  zone_id = local.zones["status.im"]
  name    = "${terraform.workspace}-referral"
  type    = "A"
  proxied = true
  value   = module.main.public_ips[0]
}

resource "cloudflare_record" "official" {
  zone_id = local.zones["status.im"]
  name    = "get"
  type    = "A"
  proxied = true
  value   = module.main.public_ips[0]
  count   = (terraform.workspace == "prod" ? 1 : 0)
}
