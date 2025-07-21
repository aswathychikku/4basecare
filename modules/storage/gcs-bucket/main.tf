##################
#  GCS Buckets   #
##################
resource "google_storage_bucket" "buckets" {
  for_each                    = var.buckets
  name                        = each.value.name
  project                     = each.value.project_id
  location                    = each.value.location
  storage_class               = each.value.storage_class
  uniform_bucket_level_access = each.value.bucket_policy_only
  force_destroy               = each.value.force_destroy
  public_access_prevention    = each.value.public_access_prevention
  labels                      = each.value.labels

  versioning {
    enabled = each.value.versioning
  }

  autoclass {
    enabled = each.value.autoclass
  }

  soft_delete_policy {
    retention_duration_seconds = each.value.retention_duration_seconds
  }
/*
  logging {
    log_bucket        = each.value.log_bucket != null ? each.value.log_bucket : ""
    log_object_prefix = each.value.log_object_prefix != null ? each.value.log_object_prefix : ""
  }
*/

  dynamic "logging" { # Converted to dynamic block
    for_each = each.value.log_bucket != null ? [1] : [] # Only create if log_bucket is provided
    content {
      log_bucket        = each.value.log_bucket
      log_object_prefix = each.value.log_object_prefix
    }
  }

  dynamic "lifecycle_rule" {
    for_each = each.value.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                        = lookup(lifecycle_rule.value.condition, "age", null)
        created_before             = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state                 = lookup(lifecycle_rule.value.condition, "with_state", contains(keys(lifecycle_rule.value.condition), "is_live") ? (lifecycle_rule.value.condition["is_live"] ? "LIVE" : null) : null)
        num_newer_versions         = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
        custom_time_before         = lookup(lifecycle_rule.value.condition, "custom_time_before", null)
        days_since_custom_time     = lookup(lifecycle_rule.value.condition, "days_since_custom_time", null)
        days_since_noncurrent_time = lookup(lifecycle_rule.value.condition, "days_since_noncurrent_time", null)
        noncurrent_time_before     = lookup(lifecycle_rule.value.condition, "noncurrent_time_before", null)
      }
    }
  }

  dynamic "cors" {
    for_each = each.value.cors
    content {
      max_age_seconds = cors.value.max_age_seconds
      method          = cors.value.method
      origin          = cors.value.origin
      response_header = cors.value.response_header
    }
  }
}
