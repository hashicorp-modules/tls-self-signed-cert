module "tls_self_signed_cert" {
  # source = "github.com/hashicorp-modules/tls-self-signed-cert"
  source = "../../../tls-self-signed-cert"

  create                = var.create
  name                  = var.name
  algorithm             = var.algorithm
  rsa_bits              = var.rsa_bits
  validity_period_hours = var.validity_period_hours
  ca_common_name        = var.ca_common_name
  organization_name     = var.organization_name
  common_name           = var.common_name
  dns_names             = var.dns_names
  ip_addresses          = var.ip_addresses
  download_certs        = true
}

module "tls_self_signed_cert_override" {
  # source = "github.com/hashicorp-modules/tls-self-signed-cert"
  source = "../../../tls-self-signed-cert"

  create                = var.create
  name                  = "${var.name}-override"
  algorithm             = var.algorithm
  rsa_bits              = var.rsa_bits
  validity_period_hours = var.validity_period_hours
  ca_common_name        = var.ca_common_name
  organization_name     = var.organization_name
  common_name           = var.common_name
  dns_names             = var.dns_names
  ip_addresses          = var.ip_addresses
  download_certs        = true

  ca_override      = true
  ca_key_override  = module.tls_self_signed_cert.ca_private_key_pem
  ca_cert_override = module.tls_self_signed_cert.ca_cert_pem
}

