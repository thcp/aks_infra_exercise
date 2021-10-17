variable "name" {
  type    = string
  default = "dev"
}
variable "namespace" {
  type    = string
  default = "dev"
}

variable "api_groups" {
  type    = list(any)
  default = []
}
variable "resources" {
  type    = list(any)
  default = []
}
variable "verbs" {
  type    = list(any)
  default = []
}