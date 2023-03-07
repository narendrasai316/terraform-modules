locals {
  sa_configs = {
    for key, sa in var.sa_configs : "${sa.name}" => sa
  }
}

resource "azurerm_storage_account" "sa" {
  for_each                         = local.sa_configs
  name                             = each.value.name
  location                         = each.value.location
  resource_group_name              = each.value.resource_group_name
  account_tier                     = each.value.account_tier
  account_replication_type         = each.value.account_replication_type
  account_kind                     = each.value.account_kind
  cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
  access_tier                      = each.value.access_tier
  enable_https_traffic_only        = each.value.enable_https_traffic_only 
  min_tls_version                  = each.value.min_tls_version
  allow_nested_items_to_be_public  = each.value.allow_nested_items_to_be_public 
  shared_access_key_enabled        = each.value.shared_access_key_enabled
  public_network_access_enabled    = each.value.public_network_access_enabled
  default_to_oauth_authentication  = each.value.default_to_oauth_authentication
  is_hns_enabled                   = each.value.is_hns_enabled
  nfsv3_enabled                    = each.value.nfsv3_enabled
  tags                             = each.value.tags

}