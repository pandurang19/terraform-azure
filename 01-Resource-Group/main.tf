provider "azurerm" {
# version = "3.31.0" # https://registry.terraform.io/providers/hashicorp/azurerm/latest
  features { }
}

# Create a Azure Resource Group
resource "azurerm_resource_group" "aks-rg" { # aks-rg is the name for terraform referance only
  name     = "aks-rg-tf" # Resource Group name which is created in Azure Cloud
  location = "Central US"

  tags = {
    "env" = "k8s-dev",
    "demotag" = "refresh"
  }
}