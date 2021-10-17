module "aks_namespace" {
  source   = "./modules/kubernetes/namespace"
  for_each = toset(var.aks_resources.namespaces)
  name     = each.key
}

module "aks_role_binding" {
  source    = "./modules/kubernetes/role_binding"
  for_each  = var.aks_resources.deployments
  name      = each.key
  namespace = each.value.namespace
}

module "aks_service_account" {
  source    = "./modules/kubernetes/service_account"
  for_each  = var.aks_resources.deployments
  name      = each.key
  namespace = each.value.namespace
}

module "aks_role" {
  source     = "./modules/kubernetes/role"
  for_each   = var.aks_resources.deployments
  name       = each.key
  namespace  = each.value.namespace
  api_groups = [""]
  resources  = ["pods"]
  verbs      = ["get"]
}

module "aks_deployment" {
  source          = "./modules/kubernetes/deployment"
  for_each        = var.aks_resources.deployments
  replicas        = each.value.replicas
  node_label      = "agentpool"
  node_values     = each.value.agentpool
  label           = each.key
  container_image = format("%s/%s:%s", each.value.docker_registry, each.value.docker_image, each.value.docker_tag)
  container_name  = each.key
  port_name       = "http"
  container_port  = each.value.port
  port_protocol   = "TCP"
  limit_cpu       = each.value.resources.limit.cpu
  limit_memory    = each.value.resources.limit.memory
  request_cpu     = each.value.resources.requests.cpu
  request_memory  = each.value.resources.requests.memory
}

