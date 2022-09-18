#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


result=`ps -ef | grep tex2img.sh` | grep -v "grep"
if [ -z "$result" ]; 
then
    echo "Not Running"
    ./tex2img.sh "$@"
else
    echo "Already Running ($result)"
    exit 1
fi  

exit 0

