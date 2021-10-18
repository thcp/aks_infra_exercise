region = "northeurope"

####
network = {
  address_space = ["10.5.0.0/18"]
  subnets = {
    nodes = "10.5.0.0/26"
  }
  network_security_rules = {
    "allow_http" = {
      priority                   = "100"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [80]
      source_address_prefixes    = ["0.0.0.0/0"]
      destination_address_prefix = "*"
    }
  }
}

aks = {
  version                         = "1.21.2"
  sku_tier                        = "Free"
  admin_user                      = "sandbox_admin_as8skd"
  system_pool_subnet              = "nodes"
  private_cluster_enabled         = false
  api_server_authorized_ip_ranges = []

  system_pool = [{
    "name"                = "sys"
    "vm_size"             = "standard_B2s"
    "os_disk_size_gb"     = 32
    "max_pods"            = 30
    "availability_zones"  = ["1"]
    "enable_auto_scaling" = false
    "count"               = 1
    "min_count"           = null
    "max_count"           = null
  }]
  user_pools = {
    "user" = {
      "vm_size"               = "Standard_B2s"
      "node_count"            = 1
      "os_disk_size_gb"       = 30
      "availability_zones"    = ["1"]
      "max_pods"              = 15
      "enable_auto_scaling"   = true
      "min_count"             = 1
      "max_count"             = 2
      "enable_node_public_ip" = false
      "subnet"                = "nodes"
    }
  }
}

aks_resources = {
  namespaces = [
    "app"
  ]
  deployments = {
    nodeapi = {
      namespace       = "app"
      docker_registry = "thclpr"
      docker_image    = "nodeapi"
      docker_tag      = "1.0.1"
      port            = 3000
      replicas        = 3
      agentpool = [
        "sys",
        "user"
      ]
      resources = {
        limit = {
          cpu    = "40m"
          memory = "512Mi"
        }
        requests = {
          cpu    = "10m"
          memory = "1Mi"
        }
      }
      hpa = {
        max_replicas = 20
        min_replicas = 3
      }
    }
  }
}