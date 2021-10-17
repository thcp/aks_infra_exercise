variable "vnet_name" {
  type    = string
  default = null
}
variable "nsg_name" {
  type    = string
  default = null
}
variable "resource_group_name" {
  type    = string
  default = null
}
variable "location" {
  type    = string
  default = null
}
variable "address_space" {
  type    = list(any)
  default = []
}
variable "dns_servers" {
  type    = list(any)
  default = []
}
variable "subnets" {
  type    = map(any)
  default = {}
}
variable "tags" {
  type    = map(any)
  default = {}
}
variable "source_address_prefix" {
  type    = string
  default = null
}