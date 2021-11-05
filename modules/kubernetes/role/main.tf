

resource "kubernetes_role" "r" {
  metadata {
    name = var.name
    labels = {
      app = var.name
    }
  }
  rule {
    api_groups = var.api_groups
    resources  = var.resources
    verbs      = var.verbs
  }
}