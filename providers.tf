provider "google" {
  project = var.projects[terraform.workspace]
  region  = var.region
}

provider "google-beta" {
  project =  var.projects[terraform.workspace]
  region  = var.region
}
