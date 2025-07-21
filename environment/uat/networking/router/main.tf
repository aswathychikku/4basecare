##################
# Cloud Router #
##################

module "routers" {
  source     = "../../../../modules/networking/cloud-router"
  project_id = var.project_id
  routers    = var.routers
}
