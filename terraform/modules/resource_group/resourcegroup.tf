variable "name" {}

variable "region" {}

variable "environment" {}

resource "azurerm_resource_group" "resource_group" {
  name     = var.name
  location = var.region

  tags = {
    environment = var.environment
  }
}

output "id" {
  value = azurerm_resource_group.resource_group.id
}

output "name" {
  value = var.name
}