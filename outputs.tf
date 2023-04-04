

### VNET
output "id" {
  description = "The virtual NetworkConfiguration ID."
  value       = try(azurerm_virtual_network.this[0].id, "")
}


output "guid" {
  description = "The GUID of the virtual network."
  value       = try(azurerm_virtual_network.this[0].guid, "")
}

### NAT

output "nat_id" {
  description = "The ID of the NAT Gateway."
  value       = try(azurerm_nat_gateway.this[0].id, "")
}

output "nat_resource_guid" {
  description = "The resource GUID property of the NAT Gateway."
  value       = try(azurerm_nat_gateway.this[0].resource_guid, "")
}
