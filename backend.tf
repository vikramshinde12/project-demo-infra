terraform {
  backend "gcs" {
    bucket = "project1-service-tfstate"
//    credentials = "~/credentials/infra-terraform.json"
    prefix = "project1/"
  }
}