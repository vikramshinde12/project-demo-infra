//variable "project_id" {
//  type        = string
//  description = "The Google Cloud Project Id"
//}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "europe-west2-a"
}

variable "composer_environment_name" {
  type        = string
  description = "The Cloud Composer environment name"
}

variable "cloud_composer_service_account" {
  type        = string
  description = "The Cloud Composer Service Account"
  default     = "composer-env-account"
}

variable "composer_repository_name" {
  type        = string
  description = "The GitHub repository of Composer source code"
  default     = "project1_composer"
}

variable "composer_branch_name" {
  type        = string
  description = "The Branch for Cloud Build Trigger."
  default     = "master"
}

variable "repo_owner" {
  type        = string
  description = "The Owner of the GitHub repository for Cloud Build Trigger."
}


variable "slack_webhook_url" {
  type        = string
  description = "The Slack Webhook URL"
}

variable "projects" {
  type = map(string)

  default = {
    dev = "absolute-water-300415"
    test = "project1-test-301712"
    prod = "prod"
  }
}