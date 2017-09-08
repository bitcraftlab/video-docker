FROM pytorch

RUN sudo apt-get update -qq  \
	&& sudo apt-get install -y --no-install-recommends libv4l-0  \
	&& sudo rm -rf /var/lib/apt/lists/*

ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libv4l/v4l2convert.so"
