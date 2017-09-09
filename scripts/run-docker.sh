#!/bin/bash

# start streaming to the camera
stream-to-cam.sh &
STREAM_PID=$!

# run the app
start-gallery2jungle-docker.sh

# stop streaming when we are done
kill $STREAM_PID
