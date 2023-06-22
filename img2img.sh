#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
#SEED=`date +%s`

STRENGTH="$1"
STEPS="$2"
PROMPT="$3"
SEED="$4"

isHQ=`echo "$2" | grep 'laion400m'`
echo "IMG2IMG QUERY($PROMPT) SEED($SEED) STEPS($STEPS) STRENGTH($STRENGTH) HQ($isHQ)" >> log.txt

echo " * "
echo " * "
echo " * "
echo " * "
echo " * "
echo " ************ $PROMPT ************  "
echo " * "
echo " STRENGTH = $STRENGTH  / STEPS = $STEPS  / SEED = $SEED"
echo " * "
echo " * "
echo " * "



if [ -z "$isHQ" ]; 
then
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 python scripts/img2img.py --prompt "$PROMPT" --init-img upimage.jpg --strength $STRENGTH --n_samples 4 --seed $SEED --ddim_steps $STEPS
 mv outputs/img2img-samples/samples/*.png outputs/txt2img-samples/samples/
else
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/img2img-samples/samples/*.png
 rm outputs/img2img-samples-laion400m/samples/*.png
 python scripts/img2img.py --prompt "$PROMPT" --init-img upimage.jpg --strength $STRENGTH --n_samples 4 --seed $SEED --ddim_steps $STEPS --laion400m 
 mv outputs/img2img-samples-laion400m/samples/*.png outputs/txt2img-samples/samples/
fi  


exit 0

