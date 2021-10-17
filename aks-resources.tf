module "aks_namespace" {
  source   = "./modules/aks/namespace"
  for_each = toset(var.aks_resources.namespaces)
  name     = each.key
}