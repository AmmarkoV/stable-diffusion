#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
 
rm outputs/txt2img-samples/samples/*.png

SEED=`date +%s`
python scripts/txt2img.py --prompt "$@" --n_samples 4 --seed $SEED --plms
echo "QUERY($@) SEED($SEED)" >> log.txt

exit 0

