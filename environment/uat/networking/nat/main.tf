###############
#  Cloud NAT  #
###############

module "cloud-nat" {
  source = "../../../../modules/networking/cloud-nat"

  project_id = var.project_id
  cloud_nat  = var.cloud_nat
}
