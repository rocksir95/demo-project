## Demo VPC Network ##

resource "google_compute_network" "vpc_network" {
  name                    = var.network
  project                 = var.project-id
  auto_create_subnetworks = false ## false= Custom & True= Automatic
  mtu                     = 1460  ## Maximun Transmission Unit in Bytes (Max Value = 1500)
}

## public subnet

resource "google_compute_subnetwork" "public-subnetwork" {
  network       = google_compute_network.vpc_network.id
  region        = var.region
  name          = var.public-subnetwork
  ip_cidr_range = var.public-subnetwork-cidr
}

## private subnet

resource "google_compute_subnetwork" "private-subnetwork" {
  network       = google_compute_network.vpc_network.id
  region        = var.region
  name          = var.private-subnetwork
  ip_cidr_range = var.private-subnetwork-cidr
}

## public Firewall

resource "google_compute_firewall" "public-firewall" {
  name    = var.public-firewall
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.public-firewall-ports
  }

  source_ranges = [var.private-subnetwork-cidr] ## Allowing traffic only from defined subnet cidrs
  target_tags   = ["web-public"]            ## Remember to add this tag to VMs in Public Subnet
}

## Private Firewall

resource "google_compute_firewall" "private-firewall" {
  name    = "private-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.private-firewall-ports
  }

  source_ranges = [var.public-subnetwork-cidr] ## Allowing traffic only from defined subnet cidrs
  target_tags   = ["web-private"]                                                                                                                                                  ## Remember to add this tag to VMs in Private Subnet
}