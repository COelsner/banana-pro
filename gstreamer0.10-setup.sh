#!/bin/sh

# GStreamer v0.10 - Setup
echo "\n\t====== Installing GStreamer =======\n"
apt-get install libgstreamer0.10-dev \
	gstreamer0.10-alsa \
	gstreamer0.10-tools

echo "\n\t====== Installing GStreamer plugins ======\n"
apt-get install gstreamer0.10-plugins-base \
	gstreamer0.10-plugins-good \
	gstreamer0.10-plugins-ugly \
	gstreamer0.10-ffmpeg
