provider "google" {
  credentials = file("terraform-test.json")
   ## The Key generated from the service account of your project in GCP in (.json) format.
  project     = var.project-id
  region      = var.region
}

module "sql-db_mysql" {
  source           = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version          = "13.0.1"
  project_id       = var.project-id
  name             = google_sql_database_instance.database-instance.id
  zone             = var.region-zone
  database_version = var.database-version
  deletion_protection = false
}

##### databade Instance #####

resource "google_sql_database_instance" "database-instance" {
  name                = "database-instance"
  database_version    = var.database-version
  deletion_protection = false
  region              = var.region
  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled = true
      private_network = true

      authorized_networks {
        value           = var.authorized-networks
        name            = var.db-username
        
      }
    
      location_preference {
        zone = var.zone
      }
    }
  }
}

##### Database #####

resource "google_sql_database" "database" {
  name                = var.database-name
  instance            = google_sql_database_instance.database-instance.id
  charset             = var.charset
  collation           = var.collation
}

##### Database User #####

resource "google_sql_user" "users" {
  name     = var.db-username
  instance = google_sql_database_instance.database-instance.id
  host     = "%"
  password = var.password
}