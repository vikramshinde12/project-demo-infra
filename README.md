# project-demo-infra
The repository is for sample infrastructure. 

## Create Infrastructure using Terraform

1. Create Project
2. Create SA, Assign the roles: Editor and download key as terraform.json
3. Create a bucket for Terraform state
4. Create Slack Webhook URL   
5. Update the configfile as per environment

```
export GOOGLE_CLOUD_KEYFILE_JSON=terraform-key.json
export GOOGLE_APPLICATION_CREDENTIALS=terraform-key.json 

terraform init
terraform plan
terraform apply
```

Note: Need to connect github repository manually first .
Cloud Build -> Triggers -> CONNECT REPOSITORY -> Select GitHub Repo -> Connect Repository
