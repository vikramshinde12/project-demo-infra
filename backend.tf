terraform {
  backend "gcs" {
    bucket = "project1-service-tfstate"
//    credentials = "~/credentials/infra-terraform.json"
    prefix = "project1/"
    encryption_key = "XJMyAttxsczUQKj9vM0w8OuP8Rf4TUbrYwuGGJZ1SRQ="
  }
}