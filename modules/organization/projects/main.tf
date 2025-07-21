resource "google_project" "projects" {
  for_each       = var.projects
  name           = each.value.project_name
  project_id     = each.value.project_id
  folder_id      = each.value.folder_id
  billing_account = each.value.billing_account_id
  labels         = each.value.labels
}