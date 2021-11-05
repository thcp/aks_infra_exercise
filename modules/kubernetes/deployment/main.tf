resource "kubernetes_deployment" "deploy" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {
        affinity {
          node_affinity {
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                match_expressions {
                  key      = var.node_label
                  operator = "In"
                  values   = var.node_values
                }
              }
            }
          }
          pod_anti_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 100
              pod_affinity_term {
                label_selector {
                  match_expressions {
                    key      = var.label
                    operator = "In"
                    values = [
                      var.name
                    ]
                  }
                }
                topology_key = "kubernetes.io/hostname"
              }
            }
          }
        }
        container {
          image = var.container_image
          name  = var.container_name

          port {
            name           = var.port_name
            container_port = var.container_port
            protocol       = var.port_protocol

          }
          resources {
            limits = {
              cpu    = var.limit_cpu
              memory = var.limit_memory
            }
            requests = {
              cpu    = var.request_cpu
              memory = var.request_memory
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = var.container_port
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}