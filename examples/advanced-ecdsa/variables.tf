variable "provision"             { }
variable "name"                  { }
variable "algorithm"             { }
variable "ecdsa_curve"           { }
variable "validity_period_hours" { }
variable "ca_common_name"        { }
variable "organization_name"     { }
variable "common_name"           { }
variable "dns_names"             { type = "list" }
variable "ip_addresses"          { type = "list" }
