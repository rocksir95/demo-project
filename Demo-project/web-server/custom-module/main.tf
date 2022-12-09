resource "google_project_service" "api" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com"
  ])
  disable_on_destroy = false
  service            = each.value
}

resource "google_compute_firewall" "web" {
  name          = "web-access"
  network       = var.network
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = var.firewall-ports
  }
}
resource "google_compute_instance" "apache-server" {
  name         = var.instance-name
  machine_type = var.machine-type
  zone         = var.region-zone
  tags         = ["web-public"]
  description  = "custom_compute_instance"
  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        my_label = "public-vm"
      }
    }
  }

  network_interface {
    subnetwork = var.subnetwork  ###this will Enable Private IP Address 
    access_config {}    ##This will Enable Public IP address
    // Ephemeral public IP
  }


  metadata_startup_script = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
echo "<h2>WebServer on GCP Build by Terraform!<h2>" >  /var/www/html/index.html
sudo systemctl restart apache2  
EOF

  depends_on = [google_project_service.api, google_compute_firewall.web]
}


  