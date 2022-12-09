module "vpc-simple" {
  source                  = "./custom-module"
  project                 = var.project
  project-id              = var.project-id
  region                  = var.region
  network                 = var.network
  public-subnetwork       = var.public-subnetwork
  private-subnetwork      = var.private-subnetwork
  public-firewall         = var.public-firewall
  private-firewall        = var.private-firewall
  public-subnetwork-cidr  = var.public-subnetwork-cidr
  private-subnetwork-cidr = var.private-subnetwork-cidr
  public-firewall-ports   = var.public-firewall-ports
  private-firewall-ports  = var.private-firewall-ports
}