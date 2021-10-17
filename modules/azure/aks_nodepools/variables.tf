variable "name" {
  type    = string
  default = ""
}

variable "kubernetes_cluster_id" {
  type    = string
  default = null
}

variable "vm_size" {
  type    = string
  default = null
}

variable "node_count" {
  type    = string
  default = 1
}

variable "node_taints" {
  type    = list(any)
  default = []
}

variable "os_disk_size_gb" {
  type    = number
  default = 50
}

variable "availability_zones" {
  type    = list(any)
  default = ["1"]
}

variable "max_pods" {
  type    = number
  default = 30
}

variable "max_count" {
  type    = number
  default = 0
}

variable "min_count" {
  type    = number
  default = 0
}

variable "enable_auto_scaling" {
  type    = bool
  default = false
}

variable "enable_node_public_ip" {
  type    = bool
  default = false
}

variable "mode" {
  type    = string
  default = "User"
}

variable "os_type" {
  type    = string
  default = "Linux"
}

variable "priority" {
  type    = string
  default = "Regular"
}

variable "vnet_subnet_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}