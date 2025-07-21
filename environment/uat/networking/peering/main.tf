resource "google_compute_network_peering" "vpc_peering" {
  for_each = var.vpc_peerings

  name                 = each.key
  network              = each.value.vpc_name1
  peer_network         = each.value.vpc_name2
  import_custom_routes = true
  export_custom_routes = true
}
