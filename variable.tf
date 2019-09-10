variable "vpc_name" {
  description = "The name of the VPC network."
}

variable "s3_terraform_bucket" {

}

variable "environment" {}
variable "region" {}

variable "availability_zones" {
  type = "map"
  default = {
    zone1 = "us-east-2a"
    zone2 = "us-east-2b"
    zone3 = "us-east-2c"
  }
}

variable "cidrblock" {
  default = "10.0.0.0/16"
}
