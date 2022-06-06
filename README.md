# Terraform project: Team-1 - AWS



## VPC group:

Module is published at Terraform Registry (https://registry.terraform.io/modules/rus777777/vpc-t1/aws/latest) :
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

* Create some parameters to enable DNS (type bool) in vpc (enableDnsHostnames and enableDnsSupport) and subnets, it could be need for internal DB - negotiate with RDS group. Each parameter sets as input variable. Default value set as for default VPC.
* Create parameter (input variable, type bool) to create NAT gateway for each privite subnets.
* Add comments, description
* Refactoring (optimize) code if you want

- - -

## ASG group:

### Tasks (draft):

* Define what input parameters need from VPC. You can fetch them from VPC backend located in S3.
* Define what input parameters need from RDS. Fetch them from RDS backend or by RDS name?
* Undestand how wordpress works
* Undestand how to script installation wordpress with template
* Parker makes Golden Image

- - -
## RDS group:

Not finished yet.

Added some draft code to launch RDS:

* Not linked with our VPC
* Login/Password is stored in Parameter Store.
* RDS resides in public subnets to be accessible from Internet - easy to check.
* Security Group is allow to access from Internet to port 3306


### Tasks (draft):
* Define what input parameters need from VPC. You can fetch them from VPC backend located in S3.
* Is RDS locate in private subnets?
* In <writer/reader>.yourdomain.com: is <yourdomain.com> internal domain?
* Negotiate with VPC group about certain parameters of VPC (enableDnsHostnames and enableDnsSupport) and subnet to enable DNS
* If RDS resides in private subnets, it could only accessable through the bastion host.
* [bonus] how to create DB in RDS, create/select table, fill table by script?

- - -

# Helpful links:

Markdown Cheatsheet

https://github.com/tchapi/markdown-cheatsheet/blob/master/README.md


Reference architecture

https://docs.aws.amazon.com/whitepapers/latest/best-practices-wordpress/reference-architecture.html

- - -

