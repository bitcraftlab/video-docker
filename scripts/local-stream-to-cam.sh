#!/bin/bash

# streaming h264 via tcp to a virtual camera
# make sure you have installed v4l2-dkms kernel modules
# 	apt-get install v4l2loopback-dkms

# ffmpeg -f h264 -i tcp://127.0.0.1:2277 -f v4l2 /dev/video0

SERVER="tcp://127.0.0.1"
PORT=2277
FORMAT=h264
DEVICE="/dev/video0"
BUFFER=1k

while true
do
	ffmpeg -f $FORMAT -i $SERVER:$PORT -f v4l2 -bufsize $BUFFER $DEVICE
	sleep 5
done
