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
    node_group = object({
      name           = string
      instance_types = list(string)
      capacity_type  = string
      ami_type       = string
      disk_size      = number
      scaling_config = object({
        desired_size = number
        max_size     = number
        min_size     = number
      })
      update_config = object({
        max_unavailable = number
      })

    })
  })
  default = {
    name      = "leolms-cluster"
    role_name = "leolms-eks-cluster-role"
    version   = "1.35"
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
    node_group = {
      name           = "leolms-eks-node-group"
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      ami_type       = "AL2023_x86_64_STANDARD"
      disk_size      = 20
      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }
      update_config = {
        max_unavailable = 2
      }
    }
  }
}
variable "principal_arn" {
  type = string
}
