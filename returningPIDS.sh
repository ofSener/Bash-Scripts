#!/bin/bash

# Author :ofSener

echo "owners and PIDS :"
ps -ef | grep docker | awk '{print $1, $2}'

echo "only PIDS:"
ps -ef | grep docker | awk -F " " '{print $2}'
echo "end"
# Easy way 
set -x
pgrep docker