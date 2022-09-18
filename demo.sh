#!/bin/bash

source stablevenv/bin/activate

until false; do
    AmmarServer/scripts/run_imagegeneration
    echo "Server 'Image Generation' stopped with exit code $?.  Respawning.." >&2
    sleep 0.1
done
  


exit 0
