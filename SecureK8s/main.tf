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

module "skg" {
  source             = "volterraedge/secure-k8s-gateway/volterra"
  version            = "0.1.0"
  skg_name           = var.name
  volterra_namespace = local.namespace
  volterra_namespace_exists = true
  app_domain         = var.app_fqdn
  aws_secret_key     = var.aws_secret_key
  aws_access_key     = var.aws_access_key
  aws_region         = var.aws_region
  aws_az             = var.aws_az
  aws_vpc_cidr        = var.aws_vpc_cidr
  aws_subnet_ce_cidr  = var.aws_subnet_ce_cidr
  aws_subnet_eks_cidr = var.aws_subnet_eks_cidr
}

output "kubeconfig_filename" {
  value = module.skg.kubeconfig_filename
}

output "app_url" {
  value = module.skg.app_url
}