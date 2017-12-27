module "tls_self_signed_cert" {
  source = "../../../tls-self-signed-cert"
  # source = "git@github.com:hashicorp-modules/tls-self-signed-cert.git?ref=f-refactor"

  count                 = "${var.count}"
  name                  = "${var.name}"
  algorithm             = "${var.algorithm}"
  ecdsa_curve           = "${var.ecdsa_curve}"
  validity_period_hours = "${var.validity_period_hours}"
  ca_common_name        = "${var.ca_common_name}"
  organization_name     = "${var.organization_name}"
  common_name           = "${var.common_name}"
  dns_names             = "${var.dns_names}"
  ip_addresses          = "${var.ip_addresses}"
}
