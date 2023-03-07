locals {
  naming_configs = local.resource_tags
}
module "resource_names" {
  source                                     = "./modules/naming"
  naming_configs                             = local.naming_configs
  resource_group_configs                     = var.resource_group_configs
  sa_configs                                 = var.sa_configs
}