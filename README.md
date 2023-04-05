# Terraform module for Azure VNET


## How to use this module

```
module "vnet" {
  source  = "foss-cafe/vnet/azurerm"
  version = "1.0.0"
  resource_group_name = "terraform-test"
  location            = "East US"

  create_vnet   = true
  name          = "terraform-test"
  address_space = ["10.0.0.0/16"]

  tags = {
    environment = "test"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway) | resource |
| [azurerm_nat_gateway_public_ip_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway_public_ip_association) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | (Required) The address space that is used the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | (Optional) Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | (Optional) The BGP community attribute in format <as-number>:<community-value>. | `string` | `null` | no |
| <a name="input_create_nat"></a> [create\_nat](#input\_create\_nat) | (Optional) Do you want to create NAT Gateway | `bool` | `true` | no |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | (Optional) Do you want to create Virtual network in Azure | `bool` | `true` | no |
| <a name="input_ddos_protection_mode"></a> [ddos\_protection\_mode](#input\_ddos\_protection\_mode) | (Optional) The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited. | `string` | `"VirtualNetworkInherited"` | no |
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | (Optional) A ddos\_protection\_plan block as documented below. | `map(string)` | `{}` | no |
| <a name="input_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#input\_ddos\_protection\_plan\_id) | (Optional) The ID of DDoS protection plan associated with the public IP. | `string` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) List of IP addresses of DNS servers | `list(string)` | `[]` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | (Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created. | `string` | `null` | no |
| <a name="input_flow_timeout_in_minutes"></a> [flow\_timeout\_in\_minutes](#input\_flow\_timeout\_in\_minutes) | (Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes. Default 4Mins | `number` | `4` | no |
| <a name="input_idle_timeout_in_minutes"></a> [idle\_timeout\_in\_minutes](#input\_idle\_timeout\_in\_minutes) | (Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. | `number` | `4` | no |
| <a name="input_ip_tags"></a> [ip\_tags](#input\_ip\_tags) | (Optional) A mapping of IP tags to assign to the public IP. Changing this forces a new resource to be created. | `map(string)` | `{}` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | (Optional) The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created. | `string` | `"IPv4"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the  network resources . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_public_ip_edge_zone"></a> [public\_ip\_edge\_zone](#input\_public\_ip\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created. | `string` | `null` | no |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | (Optional) If specified then public IP address allocated will be provided from the public IP prefix resource. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the virtual network. if you are not creating using this module | `string` | n/a | yes |
| <a name="input_reverse_fqdn"></a> [reverse\_fqdn](#input\_reverse\_fqdn) | (Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN. | `string` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard. | `string` | `"Standard"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional. Changing this forces a new resource to be created. | `string` | `"Regional"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | (Optional) A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_guid"></a> [guid](#output\_guid) | The GUID of the virtual network. |
| <a name="output_id"></a> [id](#output\_id) | The virtual NetworkConfiguration ID. |
| <a name="output_nat_id"></a> [nat\_id](#output\_nat\_id) | The ID of the NAT Gateway. |
| <a name="output_nat_resource_guid"></a> [nat\_resource\_guid](#output\_nat\_resource\_guid) | The resource GUID property of the NAT Gateway. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->