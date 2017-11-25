terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  count = "${var.provision == "true" ? 1 : 0}"

  byte_length = 4
  prefix      = "${var.name}-"
}

resource "tls_private_key" "ca" {
  count = "${var.provision == "true" ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"
}

resource "tls_self_signed_cert" "ca" {
  count = "${var.provision == "true" ? 1 : 0}"

  key_algorithm     = "${tls_private_key.ca.algorithm}"
  private_key_pem   = "${tls_private_key.ca.private_key_pem}"
  is_ca_certificate = true

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.ca_allowed_uses}"]

  subject {
    common_name  = "${var.ca_common_name}"
    organization = "${var.organization_name}"
  }

  # Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem).
  provisioner "local-exec" {
    command = "echo '${tls_self_signed_cert.ca.cert_pem}' > ${format("%s-ca.crt.pem", random_id.name.hex)} && chmod ${var.permissions} '${format("%s-ca.crt.pem", random_id.name.hex)}'"
  }
}

resource "tls_private_key" "leaf" {
  count = "${var.provision == "true" ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"

  # Write the PEM-encoded certificate private key to this path (e.g. /etc/tls/service.key.pem).
  provisioner "local-exec" {
    command = "echo '${tls_private_key.leaf.private_key_pem}' > ${format("%s-leaf.key.pem", random_id.name.hex)} && chmod ${var.permissions} '${format("%s-leaf.key.pem", random_id.name.hex)}'"
  }
}

resource "tls_cert_request" "leaf" {
  count = "${var.provision == "true" ? 1 : 0}"

  key_algorithm   = "${tls_private_key.leaf.algorithm}"
  private_key_pem = "${tls_private_key.leaf.private_key_pem}"

  dns_names    = ["${var.dns_names}"]
  ip_addresses = ["${var.ip_addresses}"]

  subject {
    common_name  = "${var.common_name}"
    organization = "${var.organization_name}"
  }
}

resource "tls_locally_signed_cert" "leaf" {
  count = "${var.provision == "true" ? 1 : 0}"

  cert_request_pem = "${tls_cert_request.leaf.cert_request_pem}"

  ca_key_algorithm   = "${tls_private_key.ca.algorithm}"
  ca_private_key_pem = "${tls_private_key.ca.private_key_pem}"
  ca_cert_pem        = "${tls_self_signed_cert.ca.cert_pem}"

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.allowed_uses}"]

  # Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/service.crt.pem).
  provisioner "local-exec" {
    command = "echo '${tls_locally_signed_cert.leaf.cert_pem}' > ${format("%s-leaf.crt.pem", random_id.name.hex)} && chmod ${var.permissions} '${format("%s-leaf.crt.pem", random_id.name.hex)}'"
  }
}
