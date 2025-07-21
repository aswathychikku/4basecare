module "uat_folders" {
  source  = "../../../modules/organization/folders"
  folders = var.folders
}

module "uat_projects" {
  source   = "../../../modules/organization/projects"
  projects = { for k, v in var.projects : k => merge(v, { folder_id = module.uat_folders.folder_ids[v.folder_key] }) }
}