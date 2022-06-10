#!/bin/bash
clear
echo "Start:" > t.tmp
date >> t.tmp
echo ""
echo "**********************************"
echo "create VPC"
echo "**********************************"
echo ""
cd vpc
echo ""
echo "Input parameters:"
echo ""
env | grep TF_VAR_*
env | grep PKR_VAR_*
cat terraform.tfvars
echo ""
echo "**********************************"
echo ""
terraform init -upgrade && terraform apply -auto-approve
cd ..

echo ""
echo "**********************************"
echo "create golden image with wordpress"
echo "**********************************"
echo ""
cd  packer
make build
cd ..

echo ""
echo "**********************************"
echo "create RDS"
echo "**********************************"
echo ""
cd rds
echo ""
echo "Input parameters:"
echo ""
cat terraform.tfvars
echo ""
echo "**********************************"
echo ""
terraform init && terraform apply -auto-approve
cd ..

echo ""
echo "**********************************"
echo "create ALB/ASG"
echo "**********************************"
echo ""
cd asg
echo ""
echo "Input parameters:"
echo ""
cat terraform.tfvars
echo ""
echo "**********************************"
echo ""
terraform init && terraform apply -auto-approve
cd ..

echo ""
echo ""
echo "**********************************"
echo "Finish! :)"
echo "**********************************"
echo ""
echo "Finish:" >> t.tmp
date >> t.tmp
cat t.tmp
rm -rf t.tmp


# bash start.sh