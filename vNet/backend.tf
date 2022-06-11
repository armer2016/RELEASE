terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-eastus"
    storage_account_name = "terraformbackendteam2"
    container_name       = "terraformtfstate"
    key                  = "team2/vnet/terraformtfstate"
    access_key           = "NFUpV6eK17Uz57hdxVSGl9RuP3VEtHeMjzLZ2ql/cS06dChmgukp3BBWKHKDl/+89jj0Aau0HTC4+AStU7mK4A=="
  }
}
