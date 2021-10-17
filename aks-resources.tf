module "aks_namespace" {
  source   = "./modules/aks/namespace"
  for_each = toset(var.aks_resources.namespaces)
  name     = each.key
}

module "aks_role_binding" {
  source    = "./modules/aks/role_binding"
  for_each  = var.aks_resources.deployments
  name      = each.key
  namespace = each.value.namespace
}