variable "api_url" {
  
}

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
