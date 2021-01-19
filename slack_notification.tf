#----------------------------------------------------------------------------------------------
#  SLACK NOTIFICATION FUNCTIONS
#      - Enable Cloud Functions API
#      - Create Cloud Storage bucket for source code
#      - Copy Source code archive to bucket
#      - Create Cloud Functions based on source code and trigger from cloud-build pub/sub topic
#----------------------------------------------------------------------------------------------

resource "google_project_service" "functions" {
  service            = "cloudfunctions.googleapis.com"
  disable_on_destroy = false
}

resource "google_storage_bucket" "bucket" {
  name = "${var.projects[terraform.workspace]}-source-bucket"
}

resource "google_storage_bucket_object" "archive" {
  bucket = google_storage_bucket.bucket.name
  name   = "index.zip"
  source = "./slack-notification-function/index.zip"
}

resource "google_cloudfunctions_function" "slack-function" {
  name        = "subscribe"
  description = "The Slack Notification Function"
  runtime     = "nodejs10"

  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = "cloud-builds"
  }

  environment_variables = {
    SLACK_WEBHOOK_URL = var.slack_webhook_url
  }

  depends_on = [google_project_service.functions]
}