#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


#result=`ps -ef | grep tex2img.sh` | grep -v "grep"
ps_out=`ps -ef | grep "tex2img.sh" | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [ -z "$result" ]; 
then
    echo "Not Running"
    ./tex2img.sh "$@"
else
    echo "Already Running ($result)"
    exit 1
fi  

exit 0

