terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.1.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "f5terracloud"

    workspaces {
      name = "f5Volterra"
    }
  }
}

provider "volterra" {
  api_p12_file = var.api_p12_file
  url          = var.api_url
}

module "app-delivery-network" {
  source             = "volterraedge/app-delivery-network/volterra"
  version            = "0.1.0"
  adn_name           = var.name
  volterra_namespace_exists = true
  volterra_namespace = local.namespace
  app_domain         = var.app_fqdn
}

output "adn_app_url" {
  value = module.app-delivery-network.app_url
}