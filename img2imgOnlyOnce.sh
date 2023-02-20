#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


#result=`ps -ef | grep tex2img.sh` | grep -v "grep"
ps_out=`ps -ef | grep "img2img.sh" | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "tex2img.sh")
if [ -z "$result" ]; 
then
    echo "Not Running"
    ./img2img.sh "$1" "$2"
else
    echo "Already Running ($result)"
    exit 1
fi  

exit 0

