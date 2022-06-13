data "terraform_remote_state" "fromVNET" {
  backend = "azurerm"
  config = {
    storage_account_name = "terraformbackendteam2"
    container_name       = "terraformtfstate"
    key                  = "team2/vnet/terraformtfstate"
    access_key           = "NFUpV6eK17Uz57hdxVSGl9RuP3VEtHeMjzLZ2ql/cS06dChmgukp3BBWKHKDl/+89jj0Aau0HTC4+AStU7mK4A=="
  }
}

data "terraform_remote_state" "fromMSQL" {
  backend = "azurerm"
  config = {
    storage_account_name = "terraformbackendteam2"
    container_name       = "terraformtfstate"
    key                  = "team2/rds/terraformtfstate"
    access_key           = "NFUpV6eK17Uz57hdxVSGl9RuP3VEtHeMjzLZ2ql/cS06dChmgukp3BBWKHKDl/+89jj0Aau0HTC4+AStU7mK4A=="
  }
}



module "scale_set_lb" {
  source            = "Meydan52/scale_set_lb/azure"
  rg_name           = data.terraform_remote_state.fromVNET.outputs.rg_name
  rg_region         = data.terraform_remote_state.fromVNET.outputs.rg_location
  subnet_id         = data.terraform_remote_state.fromVNET.outputs.subnet_ids[0] 
  ss_name           = "mytestss-123467"
  vm_sku            = "Standard_D2s_v3"
  instance_number   = 1
  admin_user_name   = "adminuser"
  admin_password    = "&*$867user34"
  image_source      = "/subscriptions/77333203-07cc-4166-ac0b-b786a47b8423/resourceGroups/StorageRG/providers/Microsoft.Compute/galleries/UbuntuApache1/images/targetUbuntu/versions/0.0.1"
  computer_name     = "mywpvm"
  Standard_LRS_name = "Standard_LRS"
  db_resource_id    = ""
}