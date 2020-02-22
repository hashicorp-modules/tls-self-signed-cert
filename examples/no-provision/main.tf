module "tls_self_signed_cert" {
  # source = "github.com/hashicorp-modules/tls-self-signed-cert"
  source = "../../../tls-self-signed-cert"

  create                = false
  name                  = "no-provision"
  validity_period_hours = "0"
  ca_common_name        = "no-provision"
  organization_name     = "no-provision"
  common_name           = "no-provision"
  dns_names             = [""]
  ip_addresses          = [""]
}

