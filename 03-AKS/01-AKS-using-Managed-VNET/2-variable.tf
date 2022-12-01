variable "prefix" { // cluster-name 
  type        = string
  description = "This variable defines the common resource prefix for AKS server"
  default     = "aks"
}

variable "location" {
  type        = string
  description = "This variable defines the region of AKS server"
  default     = "Central India"
}

variable "environment" {
  type        = string
  description = "This variable defines the environment of AKS server"
  default     = "dev"
}

variable "system_default_node_pool_vm_size" {
  type        = string
  description = "This variable defines the default_nodepool size of AKS server"
  default     = "Standard_B2s"
}

variable "user_default_node_pool_vm_size" {
  type        = string
  description = "This variable defines the default_nodepool size of AKS server"
  default     = "Standard_B2s"
}

variable "identity" {
  type        = string
  description = "This variable defines identity of AKS server"
  default     = "SystemAssigned"
}

variable "ssh_public_key" {
  type        = string
  description = "This variable defines ssh_public_key of AKS server"
  default     = "~/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
}

variable "network_plugin" {
  type        = string
  description = "This variable defines network plugin of AKS server"
  default     = "azure"
}

variable "network_policy" {
  type        = string
  description = "This variable defines network policy of AKS server"
  default     = "azure"
}


# variable "kubernetes_cluster" {
#   type = object({
#     default_node_pool_vm_size = "Standard_B2s"
#     default_node_pool_tag     = "dev"
#     identity                  = "SystemAssigned"
#     # SSH Public Key for Linux VMs which is created locally
#     ssh_public_key            = "~/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
#     network_plugin            = "azure"
#     network_policy            = "azure"
#   })
#   sensitive = true
# }




