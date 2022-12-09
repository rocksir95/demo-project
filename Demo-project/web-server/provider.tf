terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

provider "google" {
  credentials = file("terraform-test.json")
  project     = var.project-id
  region      = var.region
  zone        = var.region-zone

}