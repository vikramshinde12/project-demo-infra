variable "project_id" {
  type        = string
  description = "The Google Cloud Project Id"
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "europe-west2-a"
}

variable "composer_environment_name" {
  type = string
  description = "The Cloud Composer environment name"
}

variable "cloud_composer_service_account" {
  type = string
  description = "The Cloud Composer Service Account"
  default = "composer-env-account"
}

variable "composer_repository_name" {
  type = string
  description = "The GitHub repository of Composer source code"
  default = "vikramshinde12/project1_composer"
}

variable "composer_branch_name" {
  type = string
  description = "The Branch for Cloud Build Trigger."
  default = "master"
}