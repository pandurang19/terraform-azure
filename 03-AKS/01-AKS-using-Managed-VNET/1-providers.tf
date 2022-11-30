provider "azurerm" {
# version = "3.32.0" # https://registry.terraform.io/providers/hashicorp/azurerm/latest
  features { }
}

# Create Random pet resource
resource "random_pet" "aksrandom" {}

terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    azurerm ={ 
        source = "hashicorp/azurerm"
        version = "3.32.0"
    }

    # https://registry.terraform.io/providers/hashicorp/azuread/latest
    azuread = {
        source = "hashicorp/azuread"
        version = "2.30.0"
    }

    # https://registry.terraform.io/providers/hashicorp/random/latest
    random = {
        source = "hashicorp/random"
        version = "3.4.3"
    }
  } 
}