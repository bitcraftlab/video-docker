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

#### For using the virtual camera:

- apt-get install v4l2loopback-dkms
- apt-get install v4l2 so you can use v4l2-ctl for troubleshooting
- make sure to LD_PRELOAD or compile OpenCV with `v4l2convert.so` so it can read video4linux format.
  For Ubuntu 16.04 it should live at: `/usr/lib/x86_64-linux-gnu/libv4l/v4l2convert.so`

#### For autostart / standalone / gallery mode

- Make sure to add `v4l2loopback` to `/etc/modules` so it's always loaded.
- make the scripts executable (by soft-linking them in your users `~/bin` folder
- Check the Desktop folder for links to drag into Ubuntu's `.config/autostart` folder

Other things to consider:

- Enable autologin for your user
- Change the energy settings so your screensaver never turns on

#### For using docker:

- install docker (plus nvidia-docker)
- install deeplearning docker image of your choice (including opencv)
- extend the docker file by adding v4l2 support
