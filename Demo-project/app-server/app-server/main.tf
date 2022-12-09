module "vm" {
  source                       = "./custom-module"
  project-id                   = var.project-id
  service_account              = var.service_account
  service_account_id           = var.service_account_id
  instance_name                = var.instance_name
  machine-type                 = var.machine-type
  region                       = var.region
  region-zone                  = var.region-zone
  metadata-script              = var.metadata-script
  google_service_account-email = var.google_service_account-email
  image                        = var.image
  network                      = var.network
  subnetwork                   = var.subnetwork
}