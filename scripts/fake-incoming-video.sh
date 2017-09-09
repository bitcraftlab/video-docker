#!/bin/bash

# video is served from a remote app as h264 stream via tcp
# (the server is listening for connections)

# this script simulates the remote app.

# app dir relative to this bash script
APPDIR="$(dirname $(readlink -f $0))/.."

VIDEO="$APPDIR/videos/hof.mp4"
PORT=2277
FORMAT=h264
SPEED=200k

while true
do
	pv --quiet --rate-limit $SPEED $VIDEO | nc -t -l $PORT
	# pv --rate-limit $SPEED $VIDEO | nc -t -l $PORT 
done
