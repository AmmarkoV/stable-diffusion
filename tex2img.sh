#!/bin/bash

SEED=`date +%s`
python scripts/txt2img.py --prompt "$@" --n_samples 15 --seed $SEED --plms && scp -P 2222 outputs/txt2img-samples/samples/* ammar@ammar.gr:/home/ammar/public_html/stable-diffusion/outputs/txt2img-samples/samples


exit 0

