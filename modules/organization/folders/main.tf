# Folder under an organization.
resource "google_folder" "folders" {
  for_each = var.folders
  display_name = each.value.display_name
  parent       = each.value.parent
}

