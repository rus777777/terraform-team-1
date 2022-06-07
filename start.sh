!/bin/bash
clear
echo ""
echo "**********************************"
echo "create VPC"
echo "**********************************"
echo ""
cd vpc
echo ""
echo "Input parameters:"
echo ""
cat terraform.tfvars
echo ""
echo "**********************************"
echo ""
terraform init && terraform apply -auto-approve
cd ..


# echo ""
# echo "**********************************"
# echo "create golden image with wordpress"
# echo "**********************************"
# echo ""
# cd  asg/packer
# make build
# cd ../..

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


# bash start.sh