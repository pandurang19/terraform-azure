# Create Azure AD Group in Active Directory for AKS Admins
resource "azuread_group" "aks_administrators" {
  display_name     = "${var.prefix}-cluster-administrators"
  security_enabled = true
  description      = "Azure AKS Administrators for the ${var.prefix}-cluster."
}