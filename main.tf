terraform {
  required_version = ">= 0.9.3"
}

resource "random_id" "name" {
  count = "${var.count}"

  byte_length = 4
  prefix      = "${var.name}-${count.index + 1}-"
}

resource "tls_private_key" "ca" {
  count = "${var.count}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"
}

resource "tls_self_signed_cert" "ca" {
  count = "${var.count}"

  key_algorithm     = "${element(tls_private_key.ca.*.algorithm, count.index)}"
  private_key_pem   = "${element(tls_private_key.ca.*.private_key_pem, count.index)}"
  is_ca_certificate = true

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.ca_allowed_uses}"]

  subject {
    common_name  = "${var.ca_common_name}"
    organization = "${var.organization_name}"
  }
}

resource "null_resource" "download_ca_public_key" {
  count = "${var.count}"

  # Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_self_signed_cert.ca.*.cert_pem, count.index)}' > ${format("%s-ca.crt.pem", element(random_id.name.*.hex, count.index))} && chmod ${var.permissions} '${format("%s-ca.crt.pem", element(random_id.name.*.hex, count.index))}'"
  }
}

resource "tls_private_key" "leaf" {
  count = "${var.count}"

  algorithm   = "${var.algorithm}"
  ecdsa_curve = "${var.ecdsa_curve}"
  rsa_bits    = "${var.rsa_bits}"
}

resource "null_resource" "download_leaf_private_key" {
  count = "${var.count}"

  # Write the PEM-encoded leaf certificate private key to this path (e.g. /etc/tls/service.key.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_private_key.leaf.*.private_key_pem, count.index)}' > ${format("%s-leaf.key.pem", element(random_id.name.*.hex, count.index))} && chmod ${var.permissions} '${format("%s-leaf.key.pem", element(random_id.name.*.hex, count.index))}'"
  }
}

resource "tls_cert_request" "leaf" {
  count = "${var.count}"

  key_algorithm   = "${element(tls_private_key.leaf.*.algorithm, count.index)}"
  private_key_pem = "${element(tls_private_key.leaf.*.private_key_pem, count.index)}"

  dns_names    = ["${var.dns_names}"]
  ip_addresses = ["${var.ip_addresses}"]

  subject {
    common_name  = "${var.common_name}"
    organization = "${var.organization_name}"
  }
}

resource "tls_locally_signed_cert" "leaf" {
  count = "${var.count}"

  cert_request_pem = "${element(tls_cert_request.leaf.*.cert_request_pem, count.index)}"

  ca_key_algorithm   = "${element(tls_private_key.ca.*.algorithm, count.index)}"
  ca_private_key_pem = "${element(tls_private_key.ca.*.private_key_pem, count.index)}"
  ca_cert_pem        = "${element(tls_self_signed_cert.ca.*.cert_pem, count.index)}"

  validity_period_hours = "${var.validity_period_hours}"
  allowed_uses          = ["${var.allowed_uses}"]
}

resource "null_resource" "download_leaf_public_key" {
  count = "${var.count}"

  # Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/service.crt.pem).
  provisioner "local-exec" {
    command = "echo '${element(tls_locally_signed_cert.leaf.*.cert_pem, count.index)}' > ${format("%s-leaf.crt.pem", element(random_id.name.*.hex, count.index))} && chmod ${var.permissions} '${format("%s-leaf.crt.pem", element(random_id.name.*.hex, count.index))}'"
  }
}
