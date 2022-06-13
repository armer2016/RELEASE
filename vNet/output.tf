output rg_name {
    value = module.Azure_Vnet.resource_group_name
}

output rg_location {
    value = module.Azure_Vnet.resource_group_location
}

output "subnet_name" {
  value = module.Azure_Vnet.subnet_name
}
output "subnet_ids" {
  value = module.Azure_Vnet.subnet_id
}