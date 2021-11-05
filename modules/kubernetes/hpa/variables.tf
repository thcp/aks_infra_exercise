variable "name" {
  type    = string
  default = "dev"
}
variable "namespace" {
  type    = string
  default = "dev"
}

variable "max_replicas" {
  type    = number
  default = 2
}
variable "min_replicas" {
  type    = number
  default = 1
}