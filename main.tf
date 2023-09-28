terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.72.0"
    }
  }
}

# provider "azurerm" {
#   features {} 
# }

# Provider Block

provider "azurerm" {
    #version         =   "~> 2.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}

provider "azuread" {
    version         =   ">= 0.11"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}

module "linuxvm" {
  source  =   "./linuxVM"
}

module "storageAccount" {
  source  =   "./storageAccount"
}

module "aks" {
  source    =     "./azure/aks"
  env       =     "dev"
}
