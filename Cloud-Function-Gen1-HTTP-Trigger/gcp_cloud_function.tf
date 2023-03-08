resource "google_storage_bucket" "cf-bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
  project       = var.project_id
  labels = {
    lable = "cf-bucket"
  }
}

resource "google_storage_bucket_object" "cf-function-zip" {
  name       = "function.zip"
  source     = "function.zip"
  bucket     = google_storage_bucket.cf-bucket.name
  depends_on = [google_storage_bucket.cf-bucket]
}

resource "google_cloudfunctions_function" "function-gen1" {
  name                  = var.function_name
  description           = var.function_description
  runtime               = var.function_runtime
  source_archive_bucket = google_storage_bucket.cf-bucket.name
  source_archive_object = google_storage_bucket_object.cf-function-zip.name
  trigger_http          = true
  entry_point           = "hello"
  service_account_email = "terraform@single-azimuth-379806.iam.gserviceaccount.com"
  depends_on            = [google_storage_bucket_object.cf-function-zip]
}
