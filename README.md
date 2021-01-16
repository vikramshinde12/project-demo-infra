# project-demo-infra
The repository is for sample infrastructure. 

Create Infrastructure using Terraform
Create Project
Create SA, Assign the roles: Editor and download key as terraform.json
export GOOGLE_CLOUD_KEYFILE_JSON=terraform-key.json
terraform init
terraform plan
terraform apply

Note: Need to connect github repository manually first .
Cloud Build -> Triggers -> CONNECT REPOSITORY -> Select GitHub Repo -> Connect Repository