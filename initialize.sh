#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

ORIG_DIR=`pwd`

sudo apt install libkrb5-dev libpq-dev


python3 -m venv stablevenv
source stablevenv/bin/activate
python3 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu116


#python3 -m pip install transformers==4.19.2 diffusers invisible-watermark
python3 -m pip install requirements.txt
python3 -m pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
python3 -m pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
python3 -m pip install -e .
pip install --upgrade packaging

#python scripts/txt2img.py --prompt "a photograph of a computer chip" --plms && scp -P 2222 outputs/txt2img-samples/samples/* ammar@ammar.gr:/home/ammar/public_html/stable-diffusion/outputs/txt2img-samples/samples


exit 0
