terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.1.1"
    }
  }
}

provider "volterra" {
  api_p12_file = var.api_p12_file
  url          = var.api_url
}

resource "volterra_aws_vpc_site" "aws-site" {
  name = var.site_name
  namespace = var.namespace
  aws_region = var.region
  ssh_key = var.ssh_key

aws_cred {
  name = var.credentials
  namespace = var.namespace
}

instance_type = var.instance_type

logs_streaming_disabled = true

operating_system_version = var.os

vpc {
  new_vpc {
    name_tag = "v-${var.site_name}"
    primary_ipv4 = var.vpc_prefix
    allocate_ipv6 = false
  }
}

ingress_egress_gw {
  aws_certified_hw = "aws-byol-multi-nic-voltmesh"
  no_network_policy = "true"
  no_forward_proxy = "true"
  no_inside_static_routes = "true"
  no_outside_static_routes = "true"
  no_global_network = "true"

  az_nodes {
    aws_az_name = var.az_name
    inside_subnet {
      subnet_param {
        ipv4 = cidrsubnet(var.vpc_prefix, 4, 1)
      }
    }
    outside_subnet {
      subnet_param {
        ipv4 = cidrsubnet(var.vpc_prefix, 4, 0)
      }
    }
    workload_subnet {
      subnet_param {
        ipv4 = cidrsubnet(var.vpc_prefix, 4, 2)
      }
    }
  }
}
}

resource "volterra_tf_params_action" "aws-site" {
  depends_on = [volterra_aws_vpc_site.aws-site]
  site_name = var.site_name
  site_kind = "aws_vpc_site"
  action = "apply"
  wait_for_action = true
}

locals {
  full-site = "volterra_aws_vpc_site.${var.site_name}"
}

output public_ip {
  value = element(split(" = ",element(split("\n",volterra_tf_params_action.aws-site.tf_output),2)),1)
}

output vpc_ip {
  value = element(split(" = ",element(split("\n",volterra_tf_params_action.aws-site.tf_output),9)),1)
}