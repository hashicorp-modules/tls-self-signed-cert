output "zREADME" {
  value = <<README
# ------------------------------------------------------------------------------
# ${var.name} TLS Self Signed Certs
# ------------------------------------------------------------------------------

The below private keys and self signed TLS certificates have been generated.

- CA certificate: ${element(concat(formatlist("%s-ca", random_id.name.*.hex), [""]), 0)}
- Leaf certificate: ${element(concat(formatlist("%s-leaf", random_id.name.*.hex), [""]), 0)}

${var.download_certs ? "The below certificates and private key have been downloaded locally with the\nfile permissions updated appropriately.\n\n- ${element(
  concat(formatlist("%s-ca.crt.pem", random_id.name.*.hex), [""]),
  0,
  )}\n- ${element(
  concat(formatlist("%s-leaf.crt.pem", random_id.name.*.hex), [""]),
  0,
  )}\n- ${element(
  concat(formatlist("%s-leaf.key.pem", random_id.name.*.hex), [""]),
  0,
  )}\n\n  # View your certs\n  $ openssl x509 -text -in ${element(
  concat(formatlist("%s-ca.crt.pem", random_id.name.*.hex), [""]),
  0,
  )}\n  $ openssl x509 -text -in ${element(
  concat(formatlist("%s-leaf.crt.pem", random_id.name.*.hex), [""]),
  0,
  )}\n\n  # Verify root CA\n  $ openssl verify -CAfile ${element(
  concat(formatlist("%s-ca.crt.pem", random_id.name.*.hex), [""]),
  0,
  )} \\\n    ${element(
  concat(formatlist("%s-leaf.crt.pem", random_id.name.*.hex), [""]),
  0,
)}" : "Certs were not downloaded locally. set \"download_certs\" to true to download."}
README

}

output "algorithm" {
  value = var.algorithm
}

# CA - TLS private key
output "ca_private_key_pem" {
  value = chomp(
    element(concat(tls_private_key.ca.*.private_key_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

output "ca_public_key_pem" {
  value = chomp(
    element(concat(tls_private_key.ca.*.public_key_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

output "ca_public_key_openssh" {
  value = chomp(
    element(concat(tls_private_key.ca.*.public_key_openssh, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

# CA - TLS self signed cert
output "ca_cert_name" {
  value = element(concat(formatlist("%s-ca", random_id.name.*.hex), [""]), 0) # TODO: Workaround for issue #11210
}

output "ca_cert_filename" {
  value = element(
    concat(formatlist("%s-ca.crt.pem", random_id.name.*.hex), [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "ca_cert_pem" {
  value = chomp(element(concat(tls_self_signed_cert.ca.*.cert_pem, [""]), 0)) # TODO: Workaround for issue #11210
}

output "ca_cert_validity_start_time" {
  value = element(
    concat(tls_self_signed_cert.ca.*.validity_start_time, [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "ca_cert_validity_end_time" {
  value = element(concat(tls_self_signed_cert.ca.*.validity_end_time, [""]), 0) # TODO: Workaround for issue #11210
}

# Leaf - TLS private key
output "leaf_private_key_pem" {
  value = chomp(
    element(concat(tls_private_key.leaf.*.private_key_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

output "leaf_private_key_filename" {
  value = element(
    concat(formatlist("%s-leaf.key.pem", random_id.name.*.hex), [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "leaf_public_key_pem" {
  value = chomp(
    element(concat(tls_private_key.leaf.*.public_key_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

output "leaf_public_key_openssh" {
  value = chomp(
    element(concat(tls_private_key.leaf.*.public_key_openssh, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

# Leaf - TLS cert request
output "leaf_cert_request_pem" {
  value = chomp(
    element(concat(tls_cert_request.leaf.*.cert_request_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

# Leaf - TLS locally signed cert
output "leaf_cert_name" {
  value = element(concat(formatlist("%s-leaf", random_id.name.*.hex), [""]), 0) # TODO: Workaround for issue #11210
}

output "leaf_cert_filename" {
  value = element(
    concat(formatlist("%s-leaf.crt.pem", random_id.name.*.hex), [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "leaf_cert_pem" {
  value = chomp(
    element(concat(tls_locally_signed_cert.leaf.*.cert_pem, [""]), 0),
  ) # TODO: Workaround for issue #11210
}

output "leaf_cert_validity_start_time" {
  value = element(
    concat(tls_locally_signed_cert.leaf.*.validity_start_time, [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

output "leaf_cert_validity_end_time" {
  value = element(
    concat(tls_locally_signed_cert.leaf.*.validity_end_time, [""]),
    0,
  ) # TODO: Workaround for issue #11210
}

