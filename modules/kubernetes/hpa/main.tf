resource "kubernetes_horizontal_pod_autoscaler" "hpa" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  spec {
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = var.name
    }

    behavior {
      scale_down {
        stabilization_window_seconds = 10
        select_policy                = "Min"
        policy {
          period_seconds = 5
          type           = "Percent"
          value          = 100
        }
      }
      scale_up {
        stabilization_window_seconds = 10
        select_policy                = "Max"
        policy {
          period_seconds = 5
          type           = "Percent"
          value          = 90
        }
      }
    }
  }
}