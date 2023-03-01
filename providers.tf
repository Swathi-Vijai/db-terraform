terraform {
  backend "azurerm" { 
    resource_group_name  = "Devops-RG"
    storage_account_name = "devopstrainingstorage"
    container_name       = "swathi-tfstate-asgmt"
    key                  = "terraform.tfstate"
                   
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.3.0"
    }
  }
}

provider "databricks" {
    azure_workspace_resource_id = azurerm_databricks_workspace.adb.id
}
provider "azurerm" {
  features {}
}