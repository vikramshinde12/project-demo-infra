#----------------------------------------------------------------------------------------------
#  CLOUD BUILD
#      - Enable Cloud Build API
#      - Create Cloud Build Trigger for Cloud Composer
#----------------------------------------------------------------------------------------------

resource "google_project_service" "build" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  provider    = google-beta
  name        = "cloud-composer-trigger"
  description = "The Cloud Composer Trigger on GitHub, Push to master branch"

  github {
    owner = var.repo_owner
    name  = var.composer_repository_name
    push {
      branch = var.composer_branch_name[terraform.workspace]
    }
  }


  filename = "cloudbuild.yaml"
  substitutions = {
    _CLOUDCOMPOSER_ZIP = "Composer.zip"
    _REGION            = var.region
    _ENVIRONMENT_NAME  = var.composer_environment_name
  }

  depends_on = [google_project_service.build]
}