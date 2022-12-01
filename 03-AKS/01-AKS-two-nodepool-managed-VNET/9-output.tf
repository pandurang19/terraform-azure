output "cluster_name" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.name
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.node_resource_group
}

# output "kubernetes_versions" {
#   value = data.azurerm_kubernetes_service_versions.current.versions
# }

output "kubernetes_latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
  sensitive = true
}