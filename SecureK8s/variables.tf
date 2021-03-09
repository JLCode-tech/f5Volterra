variable "api_url" {

}

# This points the absolute path of the api credentials file you downloaded from Volterra
variable "api_p12_file" {

}

# Below is an option to pass access key and secret key as you probably don't want to save it in a file
# Use env variable before you run `terraform apply` command
# export TF_VAR_aws_access_key=<your aws access key>
# export TF_VAR_aws_secret_key=<your aws secret key>
variable "aws_access_key" {

}

variable "aws_secret_key" {

}

variable "aws_region" {

}

variable "aws_az" {

}

variable "app_fqdn" {

}

variable "namespace" {

}

variable "name" {

}

variable "aws_vpc_cidr" {

}

variable "aws_subnet_ce_cidr" {

}

# Map to hold different EKS cidr with key as desired AZ on which the subnet should exist
variable "aws_subnet_eks_cidr" {

}

locals{
  namespace = var.namespace != "" ? var.namespace : var.name
}