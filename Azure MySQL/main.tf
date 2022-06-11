data "terraform_remote_state" "fromVNET" {
  backend = "azurerm"
  config = {
    storage_account_name = "terraformbackendteam2"
    container_name       = "terraformtfstate"
    key                  = "team2/vnet/terraformtfstate"
  }
}

module "azure_mysql_database"{
source = "3latanova/mysql-database/project"

rg_name                   = data.terraform_remote_state.fromVNET.outputs.resource_group_name
rg_region                 = data.terraform_remote_state.fromVNET.outputs.resource_group_location
server_name               = "test-server-453235dsdf34534"
db_name                   = "db-example"
db_admin                  = "mysqladminun"
db_password               = "^%Gjhhjx"
sku_name                  = "GP_Gen5_2"
storage_mb                = 5120
server_version            = "5.7"
auto_grow                 = true
backup_retention_days     = 7
geo_redundant_backup      = true
infrastructure_encryption = true
public_net_access         = true
ssl_enforcement           = true
ssl_minimal_tls           = "TLS1_2"
db_charset                = "utf8"
db_collation              = "utf8_unicode_ci"
firewall_rule_name        = "firewall_rule_for_asg"
asg_ip                    = "10.0.3.123"

}