resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.cluster_name}-rg"
  location = var.location
}