resource "kubernetes_service" "svc" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }
  spec {
    selector = {
      app = var.name
    }
    session_affinity = "ClientIP"
    port {
      name        = "http"
      protocol    = "TCP"
      port        = var.port
      target_port = var.port
    }
    type = "ClusterIP"
  }
}