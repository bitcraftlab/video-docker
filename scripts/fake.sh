#!/bin/bash

# kill all the scripts on termination
trap "kill 0" SIGINT

# start streaming an incoming video
fake-incoming-video.sh &
STREAM1_PID=$!

# start streaming to the camera
local-stream-to-cam.sh &
STREAM2_PID=$!

# run the app
start-app.sh

# stop streaming when we are done
kill $STREAM1_PID
kill $STREAM2_PID
