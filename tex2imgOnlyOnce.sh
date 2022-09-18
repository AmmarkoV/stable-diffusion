#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


result=`ps -ef | grep tex2img.sh`
if [[ "$result" != "" ]];then
    echo "Running"
    exit 1
else
    echo "Not Running"
    ./tex2img.sh "$@"
fi  

exit 0

