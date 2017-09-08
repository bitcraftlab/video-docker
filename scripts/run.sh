#!/bin/bash

# start streaming to the camera
stream-to-cam.sh &
STREAM_PID=$!

# run the app
start-app.sh

# stop streaming when we are done
kill $STREAM_PID
