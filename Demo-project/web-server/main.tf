module "mysql" {
  source              = "./custom-module"
  project-id          = var.project-id
  region              = var.region
  region-zone         = var.region-zone
  database-version    = var.database-version
  tier                = var.tier
  authorized-networks = var.authorized-networks
  zone                = var.zone
  database-name       = var.database-name
  db-username         = var.db-username
  charset             = var.charset
  password            = var.password
}