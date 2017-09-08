#!/bin/bash

# add display access (insecure)
sudo xhost +local:root

# app dir relative to this bash script
APPDIR="$(dirname $(readlink -f $0))/.."

# CMD=bash
CMD="python webcam.py"

# start docker with access to display, webcam etc
#nvidia-docker run --rm -it --privileged --ipc=host   --volume=$APPDIR:/app   -e CUDA_VISIBLE_DEVICES=0   -e "DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  --volume="/dev/video0:/dev/video0" --volume="/dev/video1:/dev/video1" --volume "/dev/input:/dev/input" pytorch $CMD
nvidia-docker run --rm -it --privileged --ipc=host   --volume=$APPDIR:/app   -e CUDA_VISIBLE_DEVICES=0   -e "DISPLAY" --volume="/tmp:/tmp"  --volume="/dev/video0:/dev/video0" --volume="/dev/video1:/dev/video1" --volume "/dev/input:/dev/input" pytorch-v4l2 $CMD

# revoke display access
sudo xhost -local:root

