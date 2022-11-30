# SSH Public Key for Linux VMs which is created locally
variable "ssh_public_key" {
  default = "~/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

variable "environment" {
  type = string
  description = "This variable defines the environment of AKS server"
  default = "dev"
}

variable "location" {
  type = string
  description = "This variable defines the region of AKS server"
  default = "Central India"
}

variable "cluster_name" {
  type = string
  description = "This variable defines the resource group for AKS server"
  default = "aksdemo"
}

