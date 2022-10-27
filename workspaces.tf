/* WORKSPACES ---------------------------------------------*/

/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      host_type = "s-1vcpu-2gb"
    }

    test = {}
    prod = {
      host_type = "s-4vcpu-8gb"
    }
  }
}

/*---------------------------------------------------------*/
