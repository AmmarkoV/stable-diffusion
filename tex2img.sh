#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


result=`ps -ef | grep tex2img.sh`
if [[ "$result" != "" ]];then
    echo "Running"
    exit 0
else
    echo "Not Running"
fi 

SEED=`date +%s`
python scripts/txt2img.py --prompt "$@" --n_samples 4 --seed $SEED --plms
echo "QUERY($@) SEED($SEED)" >> log.txt

exit 0

