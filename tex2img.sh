#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
SEED=`date +%s`

isHQ=`echo "$@" | grep 'high quality'`
echo "QUERY($@) SEED($SEED) HQ($isHQ)" >> log.txt

if [ -z "$isHQ" ]; 
then
 rm outputs/txt2img-samples/samples/*.png
 python scripts/txt2img.py --prompt "$@" --n_samples 2 --seed $SEED --plms --ddim_steps 100
else
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/txt2img-samples-laion400m/samples/*.png
 python scripts/txt2img.py --prompt "$@" --n_samples 2 --seed $SEED --plms --ddim_steps 100 --n_iter 1 --laion400m 
 mv outputs/txt2img-samples-laion400m/samples/*.png outputs/txt2img-samples/samples/
fi  


exit 0

