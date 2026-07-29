terraform {

  backend "s3" {

    bucket = "project-phoenix-tf-state"

    key = "dev/terraform.tfstate"

    region = "ap-south-1"

  }

}