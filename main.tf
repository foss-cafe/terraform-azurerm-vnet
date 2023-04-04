### VNET
resource "azurerm_virtual_network" "this" {
  count = var.create_vnet ? 1 : 0

  name                    = format("%s-vnet", var.name)
  location                = var.location
  resource_group_name     = var.resource_group_name
  address_space           = var.address_space
  bgp_community           = var.bgp_community
  dns_servers             = var.dns_servers
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  dynamic "ddos_protection_plan" {
    for_each = length(keys(var.ddos_protection_plan)) == 0 ? [] : [var.ddos_protection_plan]

    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  tags = merge(
    {
      "Name" = format("%s-vnet", var.name)
    },
    var.tags
  )

}

### NAT Gateway
resource "azurerm_public_ip" "this" {
  count = var.create_nat ? 1 : 0

  name                    = format("%s-nat-ip", var.name)
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = var.allocation_method
  zones                   = var.zones
  ddos_protection_mode    = var.ddos_protection_mode
  ddos_protection_plan_id = var.ddos_protection_plan_id
  domain_name_label       = var.domain_name_label
  edge_zone               = var.public_ip_edge_zone
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  ip_tags                 = var.ip_tags
  ip_version              = var.ip_version
  public_ip_prefix_id     = var.public_ip_prefix_id
  reverse_fqdn            = var.reverse_fqdn
  sku                     = var.sku
  sku_tier                = var.sku_tier

  tags = merge(
    {
      "Name" = format("%s-nat-ip", var.name)
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = false
  }
}

resource "azurerm_nat_gateway" "this" {
  count = var.create_nat ? 1 : 0

  name                    = format("%s-nat", var.name)
  resource_group_name     = var.resource_group_name
  location                = var.location
  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones

  tags = merge(
    {
      "Name" = format("%s-nat", var.name)
    },
    var.tags
  )
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  count = var.create_nat ? 1 : 0

  nat_gateway_id       = azurerm_nat_gateway.this[0].id
  public_ip_address_id = azurerm_public_ip.this[0].id
}
