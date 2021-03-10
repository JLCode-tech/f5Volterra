variable "api_url" {

}

# This points the absolute path of the api credentials file you downloaded from Volterra
variable "api_p12_file" {

}

variable "app_fqdn" {

}

variable "namespace" {

}

variable "name" {

}

locals{
  namespace = var.namespace != "" ? var.namespace : var.name
}
