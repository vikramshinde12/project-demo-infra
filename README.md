# project-demo-infra
 

The CICD Infrastructure will be build using CloudBuild

Create GCP Project as Service Project

1. Enable Cloud Build API and IAM API
2. Manually Connect to this GitHub repository
3. Create a Trigger on push to any branch.

The sample terraform script can be found on below link
https://gist.github.com/d697b9bebf6c961da9301ba6bf876d4e



## Create GCP Environment using Terraform

1. Create Project
2. Assign Editor and Security Admin role to <service_project_number>>@cloudbuild.gserviceaccount.com
3. Create Slack Webhook URL   
4. Update the configfile as per environment


Note: Need to connect github repository manually first .
Cloud Build -> Triggers -> CONNECT REPOSITORY -> Select GitHub Repo -> Connect Repository
