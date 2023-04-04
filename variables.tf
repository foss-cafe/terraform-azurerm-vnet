variable "create_vnet" {
  type        = bool
  description = "(Optional) Do you want to create Virtual network in Azure"
  default     = true
}

variable "location" {
  type        = string
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "name" {
  type        = string
  description = "(Required) The name of the  network resources . Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. if you are not creating using this module"
}

variable "address_space" {
  type        = list(string)
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
}

variable "bgp_community" {
  type        = string
  description = "(Optional) The BGP community attribute in format <as-number>:<community-value>."
  default     = null
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers"
  default     = []
}

variable "public_ip_edge_zone" {
  type        = string
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created."
  default     = null
}

variable "flow_timeout_in_minutes" {
  type        = number
  description = "(Optional) The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes. Default 4Mins"
  default     = 4
}

variable "ddos_protection_plan" {
  type        = map(string)
  description = "(Optional) A ddos_protection_plan block as documented below."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

### NAT

variable "create_nat" {
  type        = bool
  description = "(Optional) Do you want to create NAT Gateway"
  default     = true
}


variable "allocation_method" {
  type        = string
  description = "(Optional) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}

variable "zones" {
  type        = list(string)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created."
  default     = null
}

variable "ddos_protection_mode" {
  type        = string
  description = "(Optional) The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited."
  default     = "VirtualNetworkInherited"
}

variable "ddos_protection_plan_id" {
  type        = string
  description = "(Optional) The ID of DDoS protection plan associated with the public IP."
  default     = null
}

variable "domain_name_label" {
  type        = string
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  default     = null
}

variable "edge_zone" {
  type        = string
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created."
  default     = null
}

variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  default     = 4
}

variable "ip_tags" {
  type        = map(string)
  description = "(Optional) A mapping of IP tags to assign to the public IP. Changing this forces a new resource to be created."
  default     = {}
}

variable "ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created."
  default     = "IPv4"
}

variable "public_ip_prefix_id" {
  type        = string
  description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource. Changing this forces a new resource to be created."
  default     = null
}

variable "reverse_fqdn" {
  type        = string
  description = "(Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN."
  default     = null
}

variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional. Changing this forces a new resource to be created."
  default     = "Regional"
}

variable "sku_name" {
  type        = string
  description = "(Optional) The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  default     = "Standard"
}
