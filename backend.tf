terraform {
  backend "gcs" {
    bucket = "project1-service-tfstate"
    prefix = "project1/"
  }
}