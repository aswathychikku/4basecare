project_id = "cloudside-academy"

#########
#  VPC  #
#########

vpc = {
  "vpc-uat-services-base" = {
    routing_mode                    = "REGIONAL"
    auto_create_subnetworks         = false
    delete_default_routes_on_create = false
  }
}



