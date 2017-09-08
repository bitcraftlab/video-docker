#!/bin/bash

# read from the virtual webcam because we can

# app dir relative to this bash script
APPDIR="$(dirname $(readlink -f $0))/.."


# - not usually linked in prebuilt versions of opencv, so let's preload it
# - make sure you have installed it using
#   run apt-get install libv4l-0

cd $APPDIR
LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libv4l/v4l2convert.so" python3 webcam.py

