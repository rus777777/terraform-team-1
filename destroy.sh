#!/bin/bash
clear
echo "Start:" > td.tmp
date >> td.tmp

echo ""
echo "**********************************"
echo "Destroy Project"
echo "**********************************"
echo ""
cd _release
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