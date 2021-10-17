variable "name" {
  type = string
  default = "dev"
}
variable "namespace" {
  type = string
  default = "dev"
}

variable "api_groups" {
  type = list
  default  = []
}
variable "resources" {
  type = list
  default  = []
}
variable "verbs" {
  type = list
  default  = []
}