# Terraform project: Team-1 - AWS



## <u>VPC group:</u>

Module is published at Terraform Registry:
```
module "vpc-t1" {
  source  = "rus777777/vpc-t1/aws"
  ...
}
```

Source code is in the
```
git@github.com:rus777777/terraform-aws-vpc-t1.git
```
Members of VPC group can change it.


### Tasks (draft):

* make it stylish
* add comments 
* refactoring (optimize) code if you want

## <u>ASG group:</u>

### Tasks (draft):

* Define what input parameters need from VPC. You can fetch them from VPC backend located in S3.
* Define what input parameters need from RDS. Fetch them from RDS backend or by RDS name?
* Undestand how wordpress works
* Undestand how to script installation wordpress with template
* With Parker makes Golden Image


## <u>RDS group:</u>

Added some draft code to launch RDS. Not finished yet.

Login/Password is stored in Parameter Store.


### Tasks (draft):
* Define what input parameters need from VPC. You can fetch them from VPC backend located in S3.
* Is RDS locate in private subnets?
* In <writer/reader>.yourdomain.com: is <yourdomain.com> internal domain?
* how to create DB in RDS, create/select table, fill table by script?
