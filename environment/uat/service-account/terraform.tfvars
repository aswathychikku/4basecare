project_id = "equentis-uat-env"
region     = "asia-south1"

service_accounts = {
  "equentis-uat-gcp-k8s" = {
    display_name = "equentis-uat-gcp-k8s"
    description  = "Used by GKE node pool"
  },
  "equentis-uat-gcp-vm-sa" = {
    display_name = "equentis-uat-gcp-vm-sa"
    description  = "VM deployment"
  },
  "equentis-uat-gcp-alphabet" = {
    display_name = "equentis-uat-gcp-alphabet"
    description  = "Alphabet VM service account"
  },
  "equentis-uat-gcp-blog" = {
    display_name = "equentis-uat-gcp-blog"
    description  = "Blog VM service account"
  },
  "equentis-uat-gcp-db" = {
    display_name = "equentis-uat-gcp-db"
    description  = "Used by DB VM for connecting to cloud sql"
  },
  "equentis-web-uat-svc" = {
    display_name = "equentis-web-uat-svc"
    description  = "Service account enable to access private bucket(equentis-web) through cloud cdn"
  },
}

