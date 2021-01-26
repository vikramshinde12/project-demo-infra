//#----------------------------------------------------------------------------------------------
//#  CLOUD COMPOSER ENVIRONMENT
//#      - Enable Cloud Composer API
//#      - Create Service Account for Cloud Composer
//#      - Assign roles/composer.worker role to Service Account
//#      - Create Cloud Composer environment
//#----------------------------------------------------------------------------------------------
//
//resource "google_project_service" "composer" {
//  service            = "composer.googleapis.com"
//  disable_on_destroy = false
//}
//
//resource "google_service_account" "service_account" {
//  account_id   = var.cloud_composer_service_account
//  display_name = "The Service Account for Composer Environment"
//}
//
//resource "google_project_iam_member" "composer-worker" {
//  role   = "roles/composer.worker"
//  member = "serviceAccount:${google_service_account.service_account.email}"
//}
//
//resource "google_project_iam_member" "composer-admin" {
//  role   = "roles/composer.admin"
//  member = "serviceAccount:${google_service_account.service_account.email}"
//}
//
//resource "google_composer_environment" "environment" {
//  name   = var.composer_environment_name
//  region = var.region
//
//  config {
//    node_config {
//      zone            = var.zone
//      service_account = google_service_account.service_account.email
//    }
//  }
//
//  depends_on = [google_project_service.composer]
//}