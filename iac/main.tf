######################################
# Configurações globais do Terraform #
######################################

# Configura o provider que vai ser utilizado
provider "aws" {
  region = "us-east-2"
}

# Configura Bucket que irá centralizar os estados do Terraform
terraform {
  backend "s3" {
    bucket = "mba-engdados-terraform-718373532469"
    key    = "states/mba-engdados/mod-1/terraform.tfstate"
    region = "us-east-2"
  }
}
