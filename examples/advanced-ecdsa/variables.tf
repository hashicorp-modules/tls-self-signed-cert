variable "create" {
}

variable "name" {
}

variable "algorithm" {
}

variable "ecdsa_curve" {
}

variable "validity_period_hours" {
}

variable "ca_common_name" {
}

variable "organization_name" {
}

variable "common_name" {
}

variable "dns_names" {
  type = list(string)
}

variable "ip_addresses" {
  type = list(string)
}

