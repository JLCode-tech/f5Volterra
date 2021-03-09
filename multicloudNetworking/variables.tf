variable "api_url" {
  #--- UNCOMMENT FOR TEAM OR ORG TENANTS
  default = "https://f5-apac-sp.console.ves.volterra.io/api"
  #--- UNCOMMENT FOR INDIVIDUAL/FREEMIUM
  # default = "https://console.ves.volterra.io/api"
}

# This points the absolute path of the api credentials file you downloaded from Volterra
variable "api_p12_file" {
  #default = "/mnt/c/Users/lucia/Downloads/f5-apac-sp.console.ves.volterra.io.api-creds.p12"
  default = "/mnt/c/Users/lucia/Documents/git_working/Volterra/f5-apac-sp.console.ves.volterra.io.api-creds.p12"
}

# Below is an option to pass access key and secret key as you probably don't want to save it in a file
# Use env variable before you run `terraform apply` command
# export TF_VAR_aws_access_key=<your aws access key>
# export TF_VAR_aws_secret_key=<your aws secret key>

variable "namespace" {
  default = "system"
}

variable "site_name" {
  default = "mcn"
}

variable "region" {
  default = "ap-southeast-2"
}

variable "az_name" {
    default = "ap-southeast-2a"
}

variable "ssh_key" {
    default = "" 
}

variable "credentials" {
  default = "f5-apac-sa-aws"
}

variable "instance_type" {
  default = "t3.2xlarge"
}

variable "os" {
   default = ""
}

variable "vpc_prefix" {
    default = "10.0.0.0/20"
}

locals {
  namespace = var.namespace != "" ? var.namespace : var.namespace
}