#----------------------------------------------------------------------------------------------
#  CLOUD BUILD
#      - Enable Cloud Build API
#      - Create Cloud Build Trigger for Cloud Composer
#      - Assigned composer.admin role to Cloud Build service account
#----------------------------------------------------------------------------------------------

resource "google_project_service" "build" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  provider    = google-beta
  name        = "cloud-build-trigger"
  description = "The Cloud Build Trigger based on Source code repo"

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

data "google_project" "project" {
}

resource "google_project_iam_binding" "binding" {
  members = ["serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"]
  role = "roles/composer.admin"
}