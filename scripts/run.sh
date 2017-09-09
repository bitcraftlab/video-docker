#!/bin/bash

# kill all the scripts on termination
trap "kill 0" SIGINT

# start streaming to the camera
stream-to-cam.sh &
STREAM_PID=$!

# run the app
start-app.sh

# stop streaming when we are done
kill $STREAM_PID
