#!/bin/bash

# start streaming an incoming video
fake-incoming-video.sh &
STREAM1_PID=$!

# start streaming to the camera
stream-to-cam.sh &
STREAM2_PID=$!

# run the app
start-app-docker.sh

# stop streaming when we are done
kill $STREAM1_PID
kill $STREAM2_PID
