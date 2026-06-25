
#data "terraform_remote_state" "networking" {
#  backend = "local"
#
#  config = {
#    path = "../networking/terraform.tfstate"
#  }
#}

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}