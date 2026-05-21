terraform {
  backend "azurerm" {
    resource_group_name  = "rg-lineten-sre-tfstate"
    storage_account_name = "stlinetenrizal8194"
    container_name       = "tfstate"
    key                  = "lineten-sre-assessment.tfstate"
  }
}
