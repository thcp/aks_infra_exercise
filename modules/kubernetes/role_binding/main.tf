resource "kubernetes_role_binding" "rb" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = {
      app = var.name
    }
  }
  role_ref {
    kind      = "Role"
    api_group = "rbac.authorization.k8s.io"
    name      = var.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = var.name
    namespace = var.namespace
  }
}