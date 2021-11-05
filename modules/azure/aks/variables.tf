variable "name" {
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

variable "dns_prefix" {
  type    = string
  default = null
}

variable "k8s_version" {
  type    = string
  default = null
}

variable "api_server_authorized_ip_ranges" {
  type    = list(any)
  default = null
}
variable "admin_user" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "client_id" {
  type    = string
  default = null
}

variable "client_secret" {
  type    = string
  default = null
}

variable "vnet_subnet_id" {
  type    = string
  default = null
}


variable "agent_pools" {

}

variable "node_resource_group_name" {
  type = string
}

variable "private_cluster_enabled" {
  type    = bool
  default = true
}


variable "sku_tier" {
  type    = string
  default = "Free"
}