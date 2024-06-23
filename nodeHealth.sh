#!/bin/bash

# Author : ofSener

# this script aims to check node health and print
# with the commands

set -x # debug mode

# chmod 777 nodeHealth.sh # permisson accepted.

echo "Node Health"

echo "Disk space:"
df -h 
echo "Memory:"
free -g 
echo "Avaible CPU:"
nproc


