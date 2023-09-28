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
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}

provider "azuread" {    
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}

terraform {
  backend “remote” {
    hostname = “app.terraform.io”
    organization = “pravdorubka1979”    
  }
}

module "linuxvm" {
  source  =   "./linuxVM"
}

module "storageAccount" {
  source  =   "./storageAccount"
}

# module "aks" {
#   source    =     "./aks"
#   env       =     "dev"
# }
