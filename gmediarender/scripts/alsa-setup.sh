#!/bin/sh

# ALSA setup
echo "\n\t====== Installing ALSA ======\n"
apt-get install alsa-base alsa-utils

echo "\n\t====== Testing ALSA stereo output ======\n"
speaker-test  --test wav --nloops 2  --channels 2
