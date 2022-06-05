# Terraform project - Team-1 - VPC

For team work:

1. create S3 bucket "terraform-tfstate-<YOUR_NAME>" in region "us-east-1"
2. create DynamoDB table "terraform-state-project1-vpc" with LockID key

Add backend settings to backend.tf:
```
terraform {
  backend "s3" {

    # terraform-tfstate-<YOUR_NAME>
    bucket         = "terraform-tfstate-rus" 

    key            = "project-team-1/dev/vpc"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-project1-vpc"
    encrypt        = true
  }
}
```