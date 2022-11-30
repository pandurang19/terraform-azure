resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "${var.cluster_name}-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  dns_prefix          = "${var.cluster_name}-dns-prefix"

  default_node_pool {
    name                 = "systempool"
    node_count           = 1
    vm_size              = "Standard_B2s"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones                = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    max_pods             = 30   # should have minimum >= 30 pod
    os_disk_size_gb      = 30   # should have minimum >= 30 os_disk_size
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = azurerm_subnet.subnet.id

    node_labels = {
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin      = "azure"
    network_policy      = "azure"   
    load_balancer_sku   = "standard"
    service_cidr        = "10.0.2.0/24"
    docker_bridge_cidr  = "10.0.2.0/24"
    dns_service_ip      = "10.0.2.5"
  }

  # Identity (System Assigned or Service Principal)
  identity {
    type = "SystemAssigned"
  }
}
