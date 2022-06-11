#!/bin/bash
clear
echo "Start:" > t.tmp
date >> t.tmp

echo ""
echo "**********************************"
echo "Create golden image with wordpress"
echo "**********************************"
echo ""
cd  packer
make build
cd ..

echo ""
echo "**********************************"
echo "Create Project"
echo "**********************************"
echo ""
cd _release
terraform init && terraform apply -auto-approve 
cd ..

echo ""
echo ""
echo "**********************************"
echo "Project created!"
echo "**********************************"
echo ""
echo "End:" >> t.tmp
date >> t.tmp
cat t.tmp
rm -rf t.tmp


# bash build.sh