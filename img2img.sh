#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
SEED=`date +%s`

isHQ=`echo "$@" | grep 'laion400m'`
echo "QUERY($@) SEED($SEED) HQ($isHQ)" >> log.txt

if [ -z "$isHQ" ]; 
then
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 python scripts/img2img.py --prompt "$@" --init-img upimage.jpg --strength 0.3 --n_samples 2 --seed $SEED --ddim_steps 100
 mv outputs/img2img-samples/samples/*.png outputs/txt2img-samples/samples/
else
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 rm outputs/img2img-samples-laion400m/samples/*.png
 python scripts/img2img.py --prompt "$@" --init-img upimage.jpg --n_samples 2 --seed $SEED --ddim_steps 100 --laion400m 
 mv outputs/img2img-samples-laion400m/samples/*.png outputs/txt2img-samples/samples/
fi  


exit 0

