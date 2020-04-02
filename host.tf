/**
 * This is a dev machine for developing the Starter Pack service.
 * https://github.com/status-im/starterpack-service
 **/

module "main" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 1
  env        = "starter"
  group      = "starter"
  size       = "s-2vcpu-4gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "main" {
  zone_id = local.zones["status.im"]
  name    = "${terraform.workspace}-starter-pack"
  type    = "A"
  proxied = true
  value   = module.main.public_ips[0]
}
