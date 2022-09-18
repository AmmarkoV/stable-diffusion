#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"


ps_out=`ps -ef | grep tex2img.sh | grep -v 'grep' | grep -v tex2img.sh`
result=$(echo $ps_out | grep "$1")
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

