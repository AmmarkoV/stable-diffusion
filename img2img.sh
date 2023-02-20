#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
SEED=`date +%s`

isHQ=`echo "$2" | grep 'laion400m'`
echo "QUERY($2) SEED($SEED) HQ($isHQ)" >> log.txt

if [ -z "$isHQ" ]; 
then
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 python scripts/img2img.py --prompt "$2" --init-img upimage.jpg --strength $1 --n_samples 4 --seed $SEED --ddim_steps 100
 mv outputs/img2img-samples/samples/*.png outputs/txt2img-samples/samples/
else
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 rm outputs/img2img-samples-laion400m/samples/*.png
 python scripts/img2img.py --prompt "$2" --init-img upimage.jpg --strength $1 --n_samples 4 --seed $SEED --ddim_steps 100 --laion400m 
 mv outputs/img2img-samples-laion400m/samples/*.png outputs/txt2img-samples/samples/
fi  


exit 0

