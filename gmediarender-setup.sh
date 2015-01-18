#!/bin/sh

# gmediarenderer-setup script

# ALSA setup
echo "Installing ALSA"
apt-get install alsa-base alsa-utils

echo "Testing ALSA output - stop test with CTRL-C"
speaker-test -t wav -c 2

# GStreamer setup
echo "Installing GStreamer"
apt-get install gstreamer0.10-alsa gstreamer0.10-tools libgstreamer0.10-dev

echo "Installing GStreamer plugins"
apt-get install gstreamer0.10-plugins-base /
	gstreamer0.10-plugins-good /
	gstreamer0.10-plugins-bad /
	gstreamer0.10-plugins-ugly /
	gstreamer0.10-plugins-ffmpeg