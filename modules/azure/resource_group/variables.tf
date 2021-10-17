variable "name" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = ""
}
variable "tags" {
  type    = map(any)
  default = {}
}

variable "lock_name" {
  type    = string
  default = "resource-group-level"
}
variable "lock_level" {
  type    = string
  default = "CanNotDelete"
}
variable "notes" {
  type    = string
  default = "This Resource Group cannot be deleted"
}