output "algorithm" {
  value = "${module.tls_self_signed_cert.algorithm}"
}

output "ca_private_key_pem" {
  value = "${module.tls_self_signed_cert.ca_private_key_pem}"
}

output "ca_private_key_name" {
  value = "${module.tls_self_signed_cert.ca_private_key_name}"
}

output "ca_private_key_filename" {
  value = "${module.tls_self_signed_cert.ca_private_key_filename}"
}

output "ca_public_key_pem" {
  value = "${module.tls_self_signed_cert.ca_public_key_pem}"
}

output "ca_public_key_openssh" {
  value = "${module.tls_self_signed_cert.ca_public_key_openssh}"
}

output "leaf_private_key_pem" {
  value = "${module.tls_self_signed_cert.leaf_private_key_pem}"
}

output "leaf_private_key_name" {
  value = "${module.tls_self_signed_cert.leaf_private_key_name}"
}

output "leaf_private_key_filename" {
  value = "${module.tls_self_signed_cert.leaf_private_key_filename}"
}

output "leaf_public_key_pem" {
  value = "${module.tls_self_signed_cert.leaf_public_key_pem}"
}

output "leaf_public_key_openssh" {
  value = "${module.tls_self_signed_cert.leaf_public_key_openssh}"
}

output "leaf_cert_request_pem" {
  value = "${module.tls_self_signed_cert.leaf_cert_request_pem}"
}

output "leaf_cert_pem" {
  value = "${module.tls_self_signed_cert.leaf_cert_pem}"
}

output "leaf_validity_start_time" {
  value = "${module.tls_self_signed_cert.leaf_validity_start_time}"
}

output "leaf_validity_end_time" {
  value = "${module.tls_self_signed_cert.leaf_validity_end_time}"
}

output "zREADME" {
  value = <<README
- Generated a secure RSA or ECDAS private key for the CA cert
- Generated a self signed CA cert
- Generated a secure RSA or ECDAS private key for the leaf cert
- Generated a TLS certificate request for the leaf cert
- Generated a locally signed leaf cert
- Encoded the private keys as PEM
- Downloaded the private keys locally and updated the file permissions appropriately
README
}
