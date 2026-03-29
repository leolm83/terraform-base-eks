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

variable "tags" {
  type = map(string)
  default = {
    "Project"     = "leolms-base-project"
    "Environment" = "dev"
  }
}

variable "eks_cluster" {
  type = object({
    name                      = string
    role_name                 = string
    version                   = string
    enabled_cluster_log_types = list(string)
    access_config = object({
      authentication_mode = string
    })
  })
  default = {
    name      = "leolms-cluster"
    role_name = "leolms-eks-cluster-role"
    version   = "1.32"
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler",
    ]
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
  }
}
