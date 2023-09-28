#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*   Storage account - Variables                       *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Service Principal Variables

variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
    default     =   "415c03d3-724b-41dc-b8f5-baad1d3d44ce"
}

variable "client_secret" {
    description =   "Client Secret (Password) of the application"
    type        =   string
    default     =   "Xrs8Q~JoUzMikT5rRkeCDdsK.jRzX-1JJzEXpbBM"
}

variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
    default     =   "3396e8f8-8f03-4798-8309-97dd81951437"
}

variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
    default     =   "0d46e439-2b93-4889-bfff-17f7009e1376"
}

# Resource Group

variable "rgVars" {
    description =   "Resource group variables"
    type        =   map(string)
    default     =   {
        "name"      =   "Storage-Rg"
        "location"  =   "East US"    
    }
}


# Storage account


variable "saCount" {
    default     =   2
}

variable "saVars" {
    description  =  "Variables for Storage accounts and containers"
    type         =  map(string)
    default      =  {
        "account_tier"                  =    "Standard"
        "account_replication_type"      =    "LRS"
        "container_name"                =    "diagnostics"
        "container_access_type"         =    "private"
    }
}