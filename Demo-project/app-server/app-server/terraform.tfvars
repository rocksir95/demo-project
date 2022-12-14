  project-id                   = "terraform-test-009"
  service_account              = "terraform-test-service"
  service_account_id           = "terraform-test-009"
  instance_name                = "server"
  machine-type                 = "n2-standard-2"
  region                       = "us-central1"
  region-zone                  = "us-central1-a"
  metadata-script              = "echo hi > /test.txt"
  google_service_account-email = "terraform-test-service@terraform-test-009.iam.gserviceaccount.com"
  image                        = "debian-11"
  network                      = "demo-vpc"
  subnetwork                   = "demo-private-subnetwork"