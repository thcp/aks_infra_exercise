output "client_key" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.username
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.password
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.k8.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.k8.kube_config.0.host
}

output "fqdn" {
  value = azurerm_kubernetes_cluster.k8.fqdn
}
output "private_fqdn" {
  value = azurerm_kubernetes_cluster.k8.private_fqdn
}

output "id" {
  value = azurerm_kubernetes_cluster.k8.id
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.k8.node_resource_group
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.k8.identity[0].principal_id
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.k8.kubelet_identity.0.object_id
}

output "kubelet_identity_client_id" {
  value = azurerm_kubernetes_cluster.k8.kubelet_identity.0.client_id
}

output "user_assigned_identity_id" {
  value = azurerm_kubernetes_cluster.k8.kubelet_identity.0.user_assigned_identity_id
}
