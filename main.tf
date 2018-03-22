terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  count = "${var.create ? 1 : 0}"

  byte_length = 4
  prefix      = "${var.name}-"
}

resource "tls_private_key" "ca" {
  count = "${var.create ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"
}

resource "tls_self_signed_cert" "ca" {
  count = "${var.create ? 1 : 0}"

  key_algorithm     = "${element(tls_private_key.ca.*.algorithm, 0)}"
  private_key_pem   = "${element(tls_private_key.ca.*.private_key_pem, 0)}"
  is_ca_certificate = true

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.ca_allowed_uses}"]

  subject {
    common_name  = "${var.ca_common_name}"
    organization = "${var.organization_name}"
  }
}

resource "null_resource" "download_ca_public_key" {
  count = "${var.create ? 1 : 0}"

  # Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_self_signed_cert.ca.*.cert_pem, 0)}' > ${format("%s-ca.crt.pem", element(random_id.name.*.hex, 0))} && chmod ${var.permissions} '${format("%s-ca.crt.pem", element(random_id.name.*.hex, 0))}'"
  }
}

resource "tls_private_key" "leaf" {
  count = "${var.create ? 1 : 0}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"
}

resource "null_resource" "download_leaf_private_key" {
  count = "${var.create ? 1 : 0}"

  # Write the PEM-encoded leaf certificate private key to this path (e.g. /etc/tls/service.key.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_private_key.leaf.*.private_key_pem, 0)}' > ${format("%s-leaf.key.pem", element(random_id.name.*.hex, 0))} && chmod ${var.permissions} '${format("%s-leaf.key.pem", element(random_id.name.*.hex, 0))}'"
  }
}

resource "tls_cert_request" "leaf" {
  count = "${var.create ? 1 : 0}"

  key_algorithm   = "${element(tls_private_key.leaf.*.algorithm, 0)}"
  private_key_pem = "${element(tls_private_key.leaf.*.private_key_pem, 0)}"

  dns_names    = ["${var.dns_names}"]
  ip_addresses = ["${var.ip_addresses}"]

  subject {
    common_name  = "${var.common_name}"
    organization = "${var.organization_name}"
  }
}

resource "tls_locally_signed_cert" "leaf" {
  count = "${var.create ? 1 : 0}"

  cert_request_pem = "${element(tls_cert_request.leaf.*.cert_request_pem, 0)}"

  ca_key_algorithm   = "${element(tls_private_key.ca.*.algorithm, 0)}"
  ca_private_key_pem = "${element(tls_private_key.ca.*.private_key_pem, 0)}"
  ca_cert_pem        = "${element(tls_self_signed_cert.ca.*.cert_pem, 0)}"

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.allowed_uses}"]
}

resource "null_resource" "download_leaf_public_key" {
  count = "${var.create ? 1 : 0}"

  # Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/service.crt.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_locally_signed_cert.leaf.*.cert_pem, 0)}' > ${format("%s-leaf.crt.pem", element(random_id.name.*.hex, 0))} && chmod ${var.permissions} '${format("%s-leaf.crt.pem", element(random_id.name.*.hex, 0))}'"
  }
}
