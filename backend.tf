terraform {
  backend "gcs" {
    bucket = "project1-service-states"
    credentials = "~/credentials/infra-terraform.json"
    prefix = "project1/"
  }
}