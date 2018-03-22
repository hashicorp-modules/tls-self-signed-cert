output "algorithm" {
  value = "${var.algorithm}"
}

# CA - TLS self signed cert
output "ca_cert_pem" {
  value = "${element(concat(tls_self_signed_cert.ca.*.cert_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_cert_validity_start_time" {
  value = "${element(concat(tls_self_signed_cert.ca.*.validity_start_time, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_cert_validity_end_time" {
  value = "${element(concat(tls_self_signed_cert.ca.*.validity_end_time, list("")), 0)}" # TODO: Workaround for issue #11210
}

# CA - TLS private key
output "ca_private_key_pem" {
  value = "${element(concat(tls_private_key.ca.*.private_key_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_private_key_name" {
  value = "${element(concat(formatlist("%s-ca", random_id.name.*.hex), list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_private_key_filename" {
  value = "${element(concat(formatlist("%s-ca.crt.pem", random_id.name.*.hex), list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_public_key_pem" {
  value = "${element(concat(tls_private_key.ca.*.public_key_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "ca_public_key_openssh" {
  value = "${element(concat(tls_private_key.ca.*.public_key_openssh, list("")), 0)}" # TODO: Workaround for issue #11210
}

# Leaf - TLS private key
output "leaf_private_key_pem" {
  value = "${element(concat(tls_private_key.leaf.*.private_key_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_private_key_name" {
  value = "${element(concat(formatlist("%s-cert", random_id.name.*.hex), list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_private_key_filename" {
  value = "${element(concat(formatlist("%s-cert.crt.pem", random_id.name.*.hex), list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_public_key_pem" {
  value = "${element(concat(tls_private_key.leaf.*.public_key_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_public_key_openssh" {
  value = "${element(concat(tls_private_key.leaf.*.public_key_openssh, list("")), 0)}" # TODO: Workaround for issue #11210
}

# Leaf - TLS cert request
output "leaf_cert_request_pem" {
  value = "${element(concat(tls_cert_request.leaf.*.cert_request_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

# Leaf - TLS locally signed cert
output "leaf_cert_pem" {
  value = "${element(concat(tls_locally_signed_cert.leaf.*.cert_pem, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_cert_validity_start_time" {
  value = "${element(concat(tls_locally_signed_cert.leaf.*.validity_start_time, list("")), 0)}" # TODO: Workaround for issue #11210
}

output "leaf_cert_validity_end_time" {
  value = "${element(concat(tls_locally_signed_cert.leaf.*.validity_end_time, list("")), 0)}" # TODO: Workaround for issue #11210
}
