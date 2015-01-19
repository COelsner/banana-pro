#!/bin/sh

# GStreamer v1.0 - Setup

echo "\n\t====== Installing GStreamer 1.0 =======\n"
apt-get -t wheezy-backports install \
	gstreamer1.0-alsa \
	libgstreamer1.0-dev

echo "\n\t====== Installing GStreamer plugins ======\n"
apt-get -t wheezy-backports install \
	gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-ugly \
	gstreamer1.0-libav
