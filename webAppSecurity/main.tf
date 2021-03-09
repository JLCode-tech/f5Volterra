terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.1.0"
    }
  }
}

provider "volterra" {
  api_p12_file = var.api_p12_file
  url          = var.api_url
}

module "web-app-security" {
  source             = "volterraedge/web-app-security/volterra"
  version            = "0.1.0"
  web_app_name       = var.name
  volterra_namespace_exists = true
  volterra_namespace = local.namespace
  app_domain         = var.app_fqdn
}

output "web_app_url" {
  value = module.web-app-security.app_url
}