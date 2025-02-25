#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

ORIG_DIR=`pwd`

sudo apt install libkrb5-dev libpq-dev imagemagick ffmpeg libsm6 libxext6 -y


python3 -m venv stablevenv
source stablevenv/bin/activate
python3 -m pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu116


#python3 -m pip install transformers==4.19.2 diffusers invisible-watermark
python3 -m pip install requirements.txt
python3 -m pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
python3 -m pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
python3 -m pip install -e .
pip install --upgrade packaging



cd "$DIR"
mkdir uploads

if [ -f AmmarServer/README.md ]
then
echo "AmmarServer appears to already exist .."
else
      git clone https://github.com/AmmarkoV/AmmarServer
      sudo AmmarServer/scripts/get_dependencies.sh
      cd AmmarServer
      mkdir -p public_html/uploads
      chmod 777 public_html/uploads
      cd public_html
      ln -s ../../outputs/txt2img-samples/
      ln -s ../../outputs/img2img-samples/
      ln -s ../../log.txt
      ln -s ../../upimage.jpg
      chmod 777 ../../upimage.jpg
      cd ..
      mkdir build
      cd build
      cmake ..
      make 
      cd "$DIR"
fi


curl https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media > sd-v1-4.ckpt

if [ -f models/ldm/text2img-large/model.ckpt ]
then
echo "LAION400m model appears to already exist .."
else
mkdir -p models/ldm/text2img-large/
wget -O models/ldm/text2img-large/model.ckpt https://ommer-lab.com/files/latent-diffusion/nitro/txt2img-f8-large/model.ckpt
fi


exit 0
