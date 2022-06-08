#!/bin/bash
clear
echo "Start:" > tr.tmp
date >> tr.tmp
echo ""
echo "**********************************"
echo "  Destroy project"
echo "**********************************"
echo ""
bash destroy.sh
echo ""
echo "**********************************"
echo "  Build project"
echo "**********************************"
echo ""
bash build.sh
echo "Finish:" >> tr.tmp
date >> tr.tmp
cat tr.tmp
rm -rf tr.tmp

