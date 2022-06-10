# Terraform project - Team-1 - VPC

For team work:

1. create S3 bucket "terraform-tfstate-<Account_ID>" in region "us-east-1"
2. create DynamoDB table "terraform-state-project1-vpc" with LockID key

Add backend settings to backend.tf:
```
terraform {
  backend "s3" {

    # terraform-tfstate-<Account_ID>
    bucket         = "terraform-tfstate-XXXXYYYYZZZZ" 

    key            = "project-team-1/dev/vpc"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-project1-vpc"
    encrypt        = true
  }
}
```