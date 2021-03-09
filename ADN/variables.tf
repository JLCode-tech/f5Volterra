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

variable "app_fqdn" {
  default = "adn.ves.apcjf5sa.co"
}

variable "namespace" {
  default = "j-lucia"
}

variable "name" {
  default = "sp-adn"
}

locals{
  namespace = var.namespace != "" ? var.namespace : var.name
}
