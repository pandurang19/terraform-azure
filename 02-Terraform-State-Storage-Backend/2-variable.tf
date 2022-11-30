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

variable "resource_group_name" {
  type = string
  description = "This variable defines the resource group for AKS server"
  default = "aksdemo-rg"
}