resource "aws_networkmanager_site_to_site_vpn_attachment" "networkmanager_site_to_site_vpn_attachments" {
  for_each = var.networkmanager_site_to_site_vpn_attachments

  core_network_id      = each.value.core_network_id
  vpn_connection_arn   = each.value.vpn_connection_arn
  routing_policy_label = each.value.routing_policy_label
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}

