locals {
  resource_group_configs = {
    for key, resource_group in var.resource_group_configs : "${resource_group.name}" => resource_group
  }
}

resource "azurerm_resource_group" "resource_group" {
  for_each = local.resource_group_configs
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}