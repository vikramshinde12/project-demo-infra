#----------------------------------------------------------------------------------------------
#  CLOUD BUILD
#      - Enable Cloud Build API
#      - Create Cloud Build Trigger for Cloud Composer
#----------------------------------------------------------------------------------------------

resource "google_project_service" "build" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  name = "trigger-test"

  trigger_template {
    repo_name = var.composer_repository_name
    branch_name = var.composer_branch_name
  }

  filename = "cloudbuild.yaml"
  substitutions = {
    _CLOUDCOMPOSER_ZIP = "test"
    _REGION= var.region
    _ENVIRONMENT_NAME = var.composer_environment_name
  }

  depends_on = [google_project_service.build]
}