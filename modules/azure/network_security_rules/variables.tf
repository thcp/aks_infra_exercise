variable "name" {
  type = string
}
variable "priority" {
  type = number
}
variable "direction" {
  type = string
}
variable "access" {
  type = string
}
variable "protocol" {
  type = string
}
variable "source_port_range" {
  type = string
}
variable "destination_port_ranges" {
  type    = list(any)
  default = null
}
variable "source_address_prefix" {
  type    = string
  default = null
}
variable "source_address_prefixes" {
  type    = list(any)
  default = null
}
variable "destination_address_prefix" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "network_security_group_name" {
  type = string
}