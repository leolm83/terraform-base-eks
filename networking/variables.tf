variable "region" {
  type    = string
  default = "us-east-1"
}
variable "assume_role" {
  sensitive = true
  type = object({
    role_arn    = string
    external_id = string
  })
}
variable "vpc" {
  type = object({
    name = string
    cidr_block = string
    internet_gateway_name = string
  })
  default = {
    name = "leolms-k8s-vpc"
    cidr_block = "10.0.0.0/24"
    internet_gateway_name = "internet-gateway"
  }
}