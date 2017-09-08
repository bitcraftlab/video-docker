#!/bin/bash

# streaming h264 via tcp to a virtual camera
# make sure you have installed v4l2-dkms kernel modules
# 	apt-get install v4l2loopback-dkms

# ffmpeg -f h264 -i tcp://127.0.0.1:2000 -f v4l2 /dev/video1

SERVER="tcp://127.0.0.1:2000"
FORMAT=h264
DEVICE="/dev/video1"

while true
do
	ffmpeg -f $FORMAT -i $SERVER -f v4l2 $DEVICE
	sleep 5
done
