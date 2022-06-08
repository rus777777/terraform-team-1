#!/bin/bash
clear
echo "Start:" > td.tmp
date >> td.tmp
echo ""
echo "**********************************"
echo "destroy ALB/ASG"
echo "**********************************"
echo ""
cd asg
terraform destroy -auto-approve
cd ..

echo ""
echo "**********************************"
echo "destroy RDS"
echo "**********************************"
echo ""
cd rds
terraform destroy -auto-approve
cd ..


echo ""
echo "**********************************"
echo "destroy VPC"
echo "**********************************"
echo ""
cd vpc
terraform destroy -auto-approve
cd ..

echo ""
echo ""
echo "**********************************"
echo "Finish! :)"
echo "**********************************"
echo ""
echo "Finish:" >> td.tmp
date >> td.tmp
cat td.tmp
rm -rf td.tmp

# bash destroy.sh