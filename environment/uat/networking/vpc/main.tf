#########
#  VPC  #
#########

module "vpc" {
  source     = "../../../../modules/networking/vpc"
  project_id = var.project_id
  vpc        = var.vpc
}


