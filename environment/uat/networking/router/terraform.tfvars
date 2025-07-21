project_id = "equentis-shared-services"

##################
# Cloud Router #
##################

routers = {
  "fbc-cr-uat-gcp-to-aws-as1" = {
    network     = "fbc-vpc-uat-as1"
    description = "Used to enable outbound access from VPC"
    region      = "asia-south1"
    bgp = {
      asn                = 64519
      keepalive_interval = 20
      advertise_mode     = "DEFAULT"
      advertised_groups  = []
    }
  }
}
