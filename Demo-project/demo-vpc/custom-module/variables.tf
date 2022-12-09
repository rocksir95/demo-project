## You should declare every variable you've used in this module

variable "project" {
  type = string
}

variable "project-id" {
  type = string
}

variable "region" {
  type = string
}

variable "network" {
  type = string
}

variable "public-subnetwork" {
  type = string
}

variable "private-subnetwork" {
  type = string
}

variable "public-firewall" {
  type = string
}

variable "private-firewall" {
  type = string
}

variable "public-subnetwork-cidr" {
  type = string
}

variable "private-subnetwork-cidr" {
  type = string
}

variable "public-firewall-ports" {
  type = list(any)
}

variable "private-firewall-ports" {
  type = list(any)
}