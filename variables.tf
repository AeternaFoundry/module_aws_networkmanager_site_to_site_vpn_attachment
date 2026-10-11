variable "networkmanager_site_to_site_vpn_attachments" {
  description = <<EOT
Map of networkmanager_site_to_site_vpn_attachments, attributes below
Required:
    - core_network_id
    - vpn_connection_arn
Optional:
    - routing_policy_label
    - tags
    - tags_all
EOT

  type = map(object({
    core_network_id      = string
    vpn_connection_arn   = string
    routing_policy_label = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.networkmanager_site_to_site_vpn_attachments : (
        v.routing_policy_label == null || (length(v.routing_policy_label) >= 0 && length(v.routing_policy_label) <= 256)
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.networkmanager_site_to_site_vpn_attachments : (
        can(regex("^arn:[^:]{1,63}:ec2:[^:]{0,63}:[^:]{0,63}:vpn-connection\\/vpn-[0-9a-f]{8,17}$", v.vpn_connection_arn))
      )
    ])
    error_message = "Must be valid VPN ARN"
  }
}

