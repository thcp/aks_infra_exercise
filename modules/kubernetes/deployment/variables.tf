variable "name" {
  type    = string
  default = "dev"
}
variable "namespace" {
  type    = string
  default = "dev"
}

variable "replicas" {
  type    = number
  default = 1
}
variable "node_label" {
  type    = string
  default = "dev"
}


variable "node_values" {
  type    = list(any)
  default = []
}

variable "label" {
  type    = string
  default = "dev"
}

variable "container_image" {
  type    = string
  default = "dev"
}
variable "container_name" {
  type    = string
  default = "dev"
}

variable "port_name" {
  type    = string
  default = "dev"
}
variable "container_port" {
  type    = string
  default = "dev"
}
variable "port_protocol" {
  type    = string
  default = "dev"
}


variable "limit_cpu" {
  type    = string
  default = "20m"
}
variable "limit_memory" {
  type    = string
  default = "128Mi"
}
variable "request_cpu" {
  type    = string
  default = "10m"
}
variable "request_memory" {
  type    = string
  default = "1Mi"
}

variable "port" {
  type    = number
  default = 80
}












