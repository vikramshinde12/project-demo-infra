# project-demo-infra
The repository is for sample infrastructure. 

1. Create Infrastructure using Terraform
2. Create Project
3. Create SA, Assign the roles: Editor and download key as terraform.json
4. Create a bucket for Terraform state 
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