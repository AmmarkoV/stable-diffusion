#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
#SEED=`date +%s`

STRENGTH="$1"
STEPS="$2"
PROMPT="$3"
SEED="$4"

isHQ=`echo "$2" | grep 'laion400m'` 
echo "TXT2IMG QUERY($PROMPT) SEED($SEED) STEPS($STEPS) STRENGTH($STRENGTH) HQ($isHQ)" >> log.txt

echo " * "
echo " * "
echo " * "
echo " * "
echo " * "
echo " ************ $PROMPT ************  "
echo " * "
echo " IGNOREDSTRENGTH = $STRENGTH  / STEPS = $STEPS  / SEED = $SEED"
echo " * "
echo " * "
echo " * "



if [ -z "$isHQ" ]; 
then
 rm outputs/txt2img-samples/samples/*.png
 python scripts/txt2img.py --prompt "$PROMPT" --n_samples 2 --seed $SEED --plms --ddim_steps $STEPS
else
 rm outputs/txt2img-samples/samples/*.png
 rm outputs/txt2img-samples-laion400m/samples/*.png
 python scripts/txt2img.py --prompt "$PROMPT" --n_samples 2 --seed $SEED --plms --ddim_steps $STEPS --laion400m 
 mv outputs/txt2img-samples-laion400m/samples/*.png outputs/txt2img-samples/samples/
fi  


exit 0

