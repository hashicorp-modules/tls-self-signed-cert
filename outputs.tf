output "algorithm" {
  value = "${var.algorithm}"
}

# CA Cert
output "ca_private_key_pem" {
  value = "${tls_private_key.ca.private_key_pem}"
}

output "ca_private_key_name" {
  value = "${format("%s-ca", random_id.name.hex)}"
}

output "ca_private_key_filename" {
  value = "${format("%s-ca.crt.pem", random_id.name.hex)}"
}

output "ca_public_key_pem" {
  value = "${tls_private_key.ca.public_key_pem}"
}

output "ca_public_key_openssh" {
  value = "${tls_private_key.ca.public_key_openssh}"
}

# Leaf Cert
output "leaf_private_key_pem" {
  value = "${tls_private_key.leaf.private_key_pem}"
}

output "leaf_private_key_name" {
  value = "${format("%s-cert", random_id.name.hex)}"
}

output "leaf_private_key_filename" {
  value = "${format("%s-cert.crt.pem", random_id.name.hex)}"
}

output "leaf_public_key_pem" {
  value = "${tls_private_key.leaf.public_key_pem}"
}

output "leaf_public_key_openssh" {
  value = "${tls_private_key.leaf.public_key_openssh}"
}

output "leaf_cert_request_pem" {
  value = "${tls_cert_request.leaf.cert_request_pem}"
}

output "leaf_cert_pem" {
  value = "${tls_locally_signed_cert.leaf.cert_pem}"
}

output "leaf_validity_start_time" {
  value = "${tls_locally_signed_cert.leaf.validity_start_time}"
}

output "leaf_validity_end_time" {
  value = "${tls_locally_signed_cert.leaf.validity_end_time}"
}
