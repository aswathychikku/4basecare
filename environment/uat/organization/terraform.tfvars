organization_id = "organizations/123456789"
billing_account_id = "ABCDEF-123456-789012"

folders = {
  uat = {
    display_name = "UAT"
    parent       = "organizations/123456789"
  }
  dev = {
    display_name = "Development"
    parent       = "organizations/123456789"
  }
}

projects = {
  uat-network = {
    folder_key         = "uat"
    project_name       = "uat-network"
    project_id         = "uat-network-001"
    billing_account_id = "ABCDEF-123456-789012"
    labels = {
      env = "uat"
    }
  }
  dev-apps = {
    folder_key         = "dev"
    project_name       = "dev-applications"
    project_id         = "dev-apps-001"
    billing_account_id = "ABCDEF-123456-789012"
    labels = {
      env = "dev"
    }
  }
}
