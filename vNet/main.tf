module "Azure_Vnet" {
source          = "Meydan52/vnet/azure"
rg_name         = "azure_vnet"      #please provide rg_name
rg_location     = "central US"         #please provide location
vnet_name       = "MyVnet"          #VNET Name
address_space   = ["10.0.0.0/16"]   #please provide VNET address_space
address_prefix1 = "10.0.1.0/24"     #please provide Subnet1 address_prefix
address_prefix2 = "10.0.2.0/24"     #please provide Subnet2 address_prefix
address_prefix3 = "10.0.3.0/24"     #please provide Subnet3 address_prefix
subnet_names1   = "subnet1"
subnet_names2   = "subnet2"
subnet_names3   = "subnet3"
}