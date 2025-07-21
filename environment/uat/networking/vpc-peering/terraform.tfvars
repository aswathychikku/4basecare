/* To be uncommented when we will cseate VPC-peering
##################
#  VPC peerings  # 
##################
peerings = {
  cs-peerings-prod-transit-to-prod = {
    name         = "cs-peerings-prod-transit-to-prod"
    network      = "projects/cs-network-prod-transit-01/global/networks/cs-vpc-prod-transit"
    peer_network = "projects/cs-network-prod-01/global/networks/cs-vpc-prod"
    export_custom_routes = true
  }
  cs-peerings-prod-to-prod-transit = {
    name         = "cs-peerings-prod-to-prod-transit"
    network      = "projects/cs-network-prod-01/global/networks/cs-vpc-prod"
    peer_network = "projects/cs-network-prod-transit-01/global/networks/cs-vpc-prod-transit"
    import_custom_routes = true
  }

  cs-peerings-prod-transit-to-dev = {
    name         = "cs-peerings-prod-transit-to-dev"
    network      = "projects/cs-network-prod-transit-01/global/networks/cs-vpc-prod-transit"
    peer_network = "projects/cs-network-dev-01/global/networks/cs-vpc-dev"
    export_custom_routes = true
  }
  cs-peerings-dev-to-prod-transit = {
    name         = "cs-peerings-dev-to-prod-transit"
    network      = "projects/cs-network-dev-01/global/networks/cs-vpc-dev"
    peer_network = "projects/cs-network-prod-transit-01/global/networks/cs-vpc-prod-transit"
    import_custom_routes = true
  }
}
*/
