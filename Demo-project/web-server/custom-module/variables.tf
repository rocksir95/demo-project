variable "instance-name" {
  type = string
}

variable "project-id" {
  type = string
}

variable "region" {
  type = string
}

variable "region-zone" {
  type = string
}

variable "web-server" {
  type = string
}

variable "machine-type" {
  type = string
}

variable "firewall-ports" {
  type = list(string)
}

variable "zone" {
  type = string
}

variable "image" {
  type = string
}

variable "network" {
  type = string
}
variable "subnetwork" {
  type = string
}