resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "${var.prefix}-log-analytics"
  location            = var.location
  resource_group_name =  azurerm_resource_group.aks_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}