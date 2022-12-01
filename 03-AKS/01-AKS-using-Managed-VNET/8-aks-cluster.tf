resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "${var.prefix}-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  dns_prefix          = "${var.prefix}-dns-prefix"

  default_node_pool {
    name                 = "systempool"
    node_count           = 1
    vm_size              = var.system_default_node_pool_vm_size
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    # zones                = [1, 2, 3]
    enable_auto_scaling = true
    max_count           = 3
    min_count           = 1
    max_pods            = 30 # should have minimum >= 30 pod
    os_disk_size_gb     = 30 # should have minimum >= 30 os_disk_size
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = azurerm_subnet.subnet.id

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
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    load_balancer_sku  = "standard"
    # pod_cidr           = "10.244.0.0/16" 
    service_cidr       = "10.0.0.0/24"
    docker_bridge_cidr = "172.17.0.1/24"
    dns_service_ip     = "10.0.0.10"
  }

  # Identity (System Assigned or Service Principal)
  identity {
    type = var.identity
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool_one" {
  name                  = "webpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernetes_cluster.id
  vm_size               = var.user_default_node_pool_vm_size
  enable_auto_scaling   = true
  node_count            = 1
  min_count             = 1
  max_count             = 3
  max_pods              = 30
  os_disk_size_gb       = 30
  vnet_subnet_id        = azurerm_subnet.subnet.id

  node_labels = {
    "nodepool-type"     = "user"
    "environment"       = var.environment
    "nodepoolos"        = "linux"
    "app"               = "web-app"
  }
  tags = {
    "nodepool-type"     = "user"
    "environment"       = var.environment
    "nodepoolos"        = "linux"
    "app"               = "web-app"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool_two" {
  name                  = "backendpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernetes_cluster.id
  vm_size               = var.user_default_node_pool_vm_size
  enable_auto_scaling   = true
  node_count            = 1
  min_count             = 1
  max_count             = 3
  max_pods              = 30
  os_disk_size_gb       = 30
  vnet_subnet_id        = azurerm_subnet.subnet.id

  node_labels = {
    "nodepool-type"     = "user"
    "environment"       = var.environment
    "nodepoolos"        = "linux"
    "app"               = "db-app"
  }

  tags = {
    "nodepool-type"     = "user"
    "environment"       = var.environment
    "nodepoolos"        = "linux"
    "app"               = "db-app"
  }
}

