resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.1.0/24"]
  location            = var.location
  resource_group_name =  azurerm_resource_group.aks_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "frontend"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# resource "azurerm_network_security_group" "network_security_group" {
#   name                = "${var.prefix}-nsg"
#   location            = var.location
#   resource_group_name =  azurerm_resource_group.aks_rg.name

#   security_rule {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# # NSG association with
# resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
#   subnet_id                 = azurerm_subnet.subnet.id
#   network_security_group_id = azurerm_network_security_group.network_security_group.id
# }