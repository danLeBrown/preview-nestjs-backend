terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {
  type = string
  description = "The DigitalOcean API token"
}
variable "ssh_key_name" {
  type = string
  description = "The name of the SSH key to use for the DigitalOcean Droplet"
}
variable "pvt_key" {
  type = string
  description = "The private key to use for the DigitalOcean Droplet"
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = var.ssh_key_name
}