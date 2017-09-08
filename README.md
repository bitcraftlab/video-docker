# Video-Docker

Some custom scripts for live video interaction with docker

## On the (docker) client

- reading video from real and fake webcams
- accessing webcams on the host
- accessing keyboard events on the host
- displaying a window on the host

## On the Host

- listening to an incoming video feed 
- simulating an incoming video feed 
- sending the incoming video feed to a fake webcam on the client

## Setup

On the host:

- install docker ( plus nvidia-docker)
- install deeplearning docker image of your choice (including opencv)
- extend the docker file by adding v4l2 support

