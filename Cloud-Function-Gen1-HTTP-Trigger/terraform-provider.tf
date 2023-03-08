# Define GCP Provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.55.0"
    }
  }
}

# Define Provider
provider "google" {
  project = var.project_id
  region  = var.location
}
