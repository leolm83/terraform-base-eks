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

variable "remote_backend" {
  type = object({
    bucket = string
  })
  default = {
    bucket = "leolms-tfstate-files"
  }
}


variable "tags" {
  type = map(string)
  default = {
    "Project"     = "leolms-base-project"
    "Environment" = "dev"
  }
}