############
#  Subnet  #
############

module "subnets" {
  source           = "../../../../modules/networking/subnets"
  project_id       = var.project_id
  subnets          = var.subnets
  secondary_ranges = var.secondary_ranges

}
