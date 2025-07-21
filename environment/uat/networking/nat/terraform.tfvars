# Required values
project_id = "cloudside-academy"


###############
#  Cloud NAT  #
###############
cloud_nat = {
  "fbc-nat-uat-gcp-to-aws-as1" = {
    router_name                        = "fbc-cr-uat-gcp-to-aws-as1"
    region                             = "asia-south1"
    nat_ip_allocate_option             = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  }
}
