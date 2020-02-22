output "zREADME" {
  value = <<README
- Generated a secure RSA or ECDAS private key for the CA cert
- Generated a self signed CA cert
- Generated a secure RSA or ECDAS private key for the leaf cert
- Generated a TLS certificate request for the leaf cert
- Generated a locally signed leaf cert
- Encoded the private keys as PEM

${module.tls_self_signed_cert.zREADME}${module.tls_self_signed_cert_override.zREADME}
README

}

output "algorithm" {
  value = var.algorithm
}

# CA - TLS private key
output "ca_private_key_pem" {
  value = module.tls_self_signed_cert.ca_private_key_pem
}

output "ca_public_key_pem" {
  value = module.tls_self_signed_cert.ca_public_key_pem
}

output "ca_public_key_openssh" {
  value = module.tls_self_signed_cert.ca_public_key_openssh
}

# CA - TLS self signed cert
output "ca_cert_name" {
  value = module.tls_self_signed_cert.ca_cert_name
}

output "ca_cert_filename" {
  value = module.tls_self_signed_cert.ca_cert_filename
}

output "ca_cert_pem" {
  value = module.tls_self_signed_cert.ca_cert_pem
}

output "ca_cert_validity_start_time" {
  value = module.tls_self_signed_cert.ca_cert_validity_start_time
}

output "ca_cert_validity_end_time" {
  value = module.tls_self_signed_cert.ca_cert_validity_end_time
}

# Leaf - TLS private key
output "leaf_private_key_pem" {
  value = module.tls_self_signed_cert.leaf_private_key_pem
}

output "leaf_private_key_filename" {
  value = module.tls_self_signed_cert.leaf_private_key_filename
}

output "leaf_public_key_pem" {
  value = module.tls_self_signed_cert.leaf_public_key_pem
}

output "leaf_public_key_openssh" {
  value = module.tls_self_signed_cert.leaf_public_key_openssh
}

# Leaf - TLS cert request
output "leaf_cert_request_pem" {
  value = module.tls_self_signed_cert.leaf_cert_request_pem
}

# Leaf - TLS locally signed cert
output "leaf_cert_name" {
  value = module.tls_self_signed_cert.leaf_cert_name
}

output "leaf_cert_filename" {
  value = module.tls_self_signed_cert.leaf_cert_filename
}

output "leaf_cert_pem" {
  value = module.tls_self_signed_cert.leaf_cert_pem
}

output "leaf_cert_validity_start_time" {
  value = module.tls_self_signed_cert.leaf_cert_validity_start_time
}

output "leaf_cert_validity_end_time" {
  value = module.tls_self_signed_cert.leaf_cert_validity_end_time
}

## Override
# CA - TLS private key
output "ca_private_key_pem_override" {
  value = module.tls_self_signed_cert_override.ca_private_key_pem
}

output "ca_public_key_pem_override" {
  value = module.tls_self_signed_cert_override.ca_public_key_pem
}

output "ca_public_key_openssh_override" {
  value = module.tls_self_signed_cert_override.ca_public_key_openssh
}

# CA - TLS self signed cert
output "ca_cert_name_override" {
  value = module.tls_self_signed_cert_override.ca_cert_name
}

output "ca_cert_filename_override" {
  value = module.tls_self_signed_cert_override.ca_cert_filename
}

output "ca_cert_pem_override" {
  value = module.tls_self_signed_cert_override.ca_cert_pem
}

output "ca_cert_validity_start_time_override" {
  value = module.tls_self_signed_cert_override.ca_cert_validity_start_time
}

output "ca_cert_validity_end_time_override" {
  value = module.tls_self_signed_cert_override.ca_cert_validity_end_time
}

# Leaf - TLS private key
output "leaf_private_key_pem_override" {
  value = module.tls_self_signed_cert_override.leaf_private_key_pem
}

output "leaf_private_key_filename_override" {
  value = module.tls_self_signed_cert_override.leaf_private_key_filename
}

output "leaf_public_key_pem_override" {
  value = module.tls_self_signed_cert_override.leaf_public_key_pem
}

output "leaf_public_key_openssh_override" {
  value = module.tls_self_signed_cert_override.leaf_public_key_openssh
}

# Leaf - TLS cert request
output "leaf_cert_request_pem_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_request_pem
}

# Leaf - TLS locally signed cert
output "leaf_cert_name_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_name
}

output "leaf_cert_filename_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_filename
}

output "leaf_cert_pem_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_pem
}

output "leaf_cert_validity_start_time_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_validity_start_time
}

output "leaf_cert_validity_end_time_override" {
  value = module.tls_self_signed_cert_override.leaf_cert_validity_end_time
}

