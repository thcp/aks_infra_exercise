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
      version = "= 2.80.0"
      source  = "hashicorp/azurerm"
    }
  } 
}

provider "azurerm" {
  features {}
}

locals {
  base_tags = {
    workspace = terraform.workspace
    source    = "terraform"
  }
}