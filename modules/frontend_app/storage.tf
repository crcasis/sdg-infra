# resource "google_storage_bucket" "documents" {
#   project  = var.project_id
#   location = var.region

#   name = var.bucket_name

#   uniform_bucket_level_access = true

#   versioning {
#     enabled = true
#   }
# }