variable "region" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "network" {
  type = any
}

variable "aks" {
  description = "AKS variables"
  type        = any
}

variable "aks_resources" {
  type    = any
  default = {}
}