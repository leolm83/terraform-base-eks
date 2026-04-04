data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["leolms-k8s-vpc"]
  }
}
