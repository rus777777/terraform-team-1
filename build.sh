#!/bin/bash
clear
echo "Start:" > t.tmp
date >> t.tmp

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
echo "create Project"
echo "**********************************"
echo ""
cd _release
terraform init && terraform apply -auto-approve -var-file=example.tfvars
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