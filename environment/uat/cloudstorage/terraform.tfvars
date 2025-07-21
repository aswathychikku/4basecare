##################
#  GCS Buckets   #
##################
buckets = {
  "frontend-apps-logs" = {
    name                     = "frontend-apps-logs"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "equeconnect-frontend" = {
    name                     = "equeconnect-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "equeconnect/equeconnect"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "informedinvestorr-uat" = {
    name                     = "informedinvestorr-uat"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "multiplyrr-frontend" = {
    name                     = "multiplyrr-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "multiplyrr/multiplyrr"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "onboarding-ec-frontend" = {
    name                     = "onboarding-ec-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "onboarding-ec/onboarding-ec"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "portfoliobuilder-frontend" = {
    name                     = "portfoliobuilder-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "portfoliobuilder/portfoliobuilder"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "secrrets-frontend" = {
    name                     = "secrrets-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "secrrets/secrrets"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "createwealth-frontend" = {
    name                     = "createwealth-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "createwealth/createwealth"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "secrrets-uat" = {
    name                     = "secrrets-uat"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    cors = [
      {
        origin          = ["https://backoffice-uat-gcp.secrrets.com"]
        method          = ["GET", "POST", "PUT", "DELETE"]
        response_header = ["Content-Type", "Authorization"]
        max_age_seconds = 3600
      }
    ]
    lifecycle_rules = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "alphabet-frontend" = {
    name                     = "alphabet-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "alphabet/alphabet"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "alphabet-uat" = {
    name                     = "alphabet-uat"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "ec-iir-frontend" = {
    name                     = "ec-iir-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "ec-iir/ec-iir"
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "equeconnect-uat" = {
    name       = "equeconnect-uat"
    project_id = "equentis-uat-env"
    location   = "asia-south1"
    versioning = false
    cors = [
      {
        origin          = ["https://ec-iir-uat-gcp.equentisedutech.com"]
        method          = ["GET", "POST", "PUT", "DELETE"]
        response_header = ["Content-Type", "Authorization"]
        max_age_seconds = 3600
      }
    ]
    lifecycle_rules = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "equentis-web-uat" = {
    name                     = "equentis-web-uat"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    versioning               = false
    cors = [
      {
        origin          = ["https://cms-uat-gcp.equentis.com"]
        method          = ["GET", "POST", "PUT", "DELETE"]
        response_header = ["Content-Type", "Authorization"]
        max_age_seconds = 3600
      }
    ]
    lifecycle_rules = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  },
  "secrretswebsite-frontend" = {
    name                     = "secrretswebsite-frontend"
    project_id               = "equentis-uat-env"
    location                 = "asia-south1"
    log_bucket               = "frontend-apps-logs"
    log_object_prefix        = "secrretswebsite/secrretswebsite"
    public_access_prevention = "inherited"
    versioning               = false
    lifecycle_rules          = []
    labels = {
      deployed-by = "cloudside"
      env         = "uat"
      team        = "devops"
    }
  }
}
