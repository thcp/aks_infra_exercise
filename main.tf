terraform {
  backend "remote" {
    organization = "thclpr"

    workspaces {
      name = "default"
    }
  }

  required_version = "~> 1.0"

  required_providers {
    azurerm = {
      version = "= 2.78.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.aks.host
  username               = module.aks.cluster_username
  password               = module.aks.cluster_password
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.aks.host
    username               = module.aks.cluster_username
    password               = module.aks.cluster_password
    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}

locals {
  base_tags = {
    workspace = terraform.workspace
    source    = "terraform"
  }
}