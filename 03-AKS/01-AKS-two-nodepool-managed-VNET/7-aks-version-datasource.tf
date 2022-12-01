# Datasource to get Latest Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false  # include_preview defaults to true which means we get preview version as latest version which we should not use in production.
}

