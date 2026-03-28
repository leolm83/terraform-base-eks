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
    name                    = string
    cidr_block              = string
    internet_gateway_name   = string
    public_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    name                    = "leolms-k8s-vpc"
    cidr_block              = "10.0.0.0/24"
    internet_gateway_name   = "internet-gateway"
    public_route_table_name = "public-route-table"
    public_subnets = [{
      name                    = "public-subnet-us-east-1a"
      cidr_block              = "10.0.0.0/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      }, { name               = "public-subnet-us-east-1b"
      cidr_block              = "10.0.0.64/27"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = true
      }
    ]
  }
}