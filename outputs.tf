output "algorithm" {
  value = "${var.algorithm}"
}

# CA Cert
output "ca_private_key_pem" {
  value = "${element(tls_private_key.ca.*.private_key_pem, 0)}"
}

output "ca_private_key_name" {
  value = "${format("%s-ca", element(random_id.name.*.hex, 0))}"
}

output "ca_private_key_filename" {
  value = "${format("%s-ca.crt.pem", element(random_id.name.*.hex, 0))}"
}

output "ca_public_key_pem" {
  value = "${element(tls_private_key.ca.*.public_key_pem, 0)}"
}

output "ca_public_key_openssh" {
  value = "${element(tls_private_key.ca.*.public_key_openssh, 0)}"
}

# Leaf Cert
output "leaf_private_key_pem" {
  value = "${element(tls_private_key.leaf.*.private_key_pem, 0)}"
}

output "leaf_private_key_name" {
  value = "${format("%s-cert", element(random_id.name.*.hex, 0))}"
}

output "leaf_private_key_filename" {
  value = "${format("%s-cert.crt.pem", element(random_id.name.*.hex, 0))}"
}

output "leaf_public_key_pem" {
  value = "${element(tls_private_key.leaf.*.public_key_pem, 0)}"
}

output "leaf_public_key_openssh" {
  value = "${element(tls_private_key.leaf.*.public_key_openssh, 0)}"
}

output "leaf_cert_request_pem" {
  value = "${element(tls_cert_request.leaf.*.cert_request_pem, 0)}"
}

output "leaf_cert_pem" {
  value = "${element(tls_locally_signed_cert.leaf.*.cert_pem, 0)}"
}

output "leaf_validity_start_time" {
  value = "${element(tls_locally_signed_cert.leaf.*.validity_start_time, 0)}"
}

output "leaf_validity_end_time" {
  value = "${element(tls_locally_signed_cert.leaf.*.validity_end_time, 0)}"
}
