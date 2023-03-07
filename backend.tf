terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "saiterraformsa"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
}