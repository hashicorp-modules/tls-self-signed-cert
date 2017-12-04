# TLS Self Signed Cert Terraform Module

- Generates a secure RSA or ECDAS private key for the CA cert
- Generates a self signed CA cert
- Generates a secure RSA or ECDAS private key for the leaf cert
- Generates a TLS certificate request for the leaf cert
- Generates a locally signed leaf cert
- Encodes the private keys as PEM
- Downloads the private keys locally and updates the file permissions appropriately

## Environment Variables

This module doesn't require any environment variables to be set.

## Input Variables

- `provision`: [Optional] Override to prevent provisioning resources in this module, defaults to "true".
- `name`: [Optional] Filename to write the private key data to, default to \"tls-private-key\".
- `algorithm`: [Optional] The name of the algorithm to use for the key. Currently-supported values are "RSA" and "ECDSA". Defaults to "RSA".
- `rsa_bits`: [Optional] When algorithm is "RSA", the size of the generated RSA key in bits. Defaults to "2048".
- `ecdsa_curve`: [Optional] When algorithm is "ECDSA", the name of the elliptic curve to use. May be any one of "P224", "P256", "P384" or "P521". Defaults to "P224".
- `permissions`: [Optional] The Unix file permission to assign to the cert files (e.g. 0600).
- `validity_period_hours`: [Required] The number of hours after initial issuing that the certificate will become invalid.
- `ca_allowed_uses`: [Optional] List of keywords from RFC5280 describing a use that is permitted for the CA certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses.
- `ca_common_name`: [Required] The common name to use in the subject of the CA certificate (e.g. hashicorp.com).
- `organization_name`: [Required] The name of the organization to associate with the certificates (e.g. HashiCorp Inc.).
- `allowed_uses`: [Required] List of keywords from RFC5280 describing a use that is permitted for the issued certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses.
- `common_name`: [Required] The common name to use in the subject of the certificate (e.g. hashicorp.com).
- `dns_names`: [Required] List of DNS names for which the certificate will be valid (e.g. foo.hashicorp.com).
- `ip_addresses`: [Required] List of IP addresses for which the certificate will be valid (e.g. 127.0.0.1).

## Outputs

- `algorithm`: The algorithm that was selected for the key.

- `ca_private_key_pem`: The CA cert private key data in PEM format.
- `ca_private_key_name`: The CA cert private key filename.
- `ca_private_key_filename`: The CA cert private key filename with file extension.
- `ca_public_key_pem`: The CA cert public key data in PEM format.
- `ca_public_key_openssh`: The CA cert public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves "P256", "P384" and "P251" are supported. This attribute is empty if an incompatible ECDSA curve is selected.

- `leaf_private_key_pem`: The Leaf cert private key data in PEM format.
- `leaf_private_key_name`: The Leaf cert private key filename.
- `leaf_private_key_filename`: The Leaf cert private key filename with file extension.
- `leaf_public_key_pem`: The Leaf cert public key data in PEM format.
- `leaf_public_key_openssh`: The Leaf cert public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves "P256", "P384" and "P251" are supported. This attribute is empty if an incompatible ECDSA curve is selected.
- `leaf_cert_request_pem`: The Leaf cert request data in PEM format.
- `leaf_cert_pem`: The Leaf cert data in PEM format.
- `leaf_validity_start_time`: The time after which the certificate is valid, as an RFC3339 timestamp.
- `leaf_validity_end_time`: The time until which the certificate is invalid, as an RFC3339 timestamp.

## Submodules

This module has no submodules.

## Authors

HashiCorp Solutions Engineering Team.

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
