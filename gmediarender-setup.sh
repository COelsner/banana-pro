#!/bin/sh

# heigh and width of dialogs
height=0
width=0

# git folder
folder=~/gmrender-resurrect

# main title
backtitle="GMediaRender Setup for Banana Pi/Pro"

alsa_setup(){
  local title="ALSA Setup"
  echo "\n====== $title - Install ======"
  apt-get -y install alsa-base alsa-utils

  local question="Do you want to test the HDMI audio output? HDMI needs to be plugged in..."
  dialog --backtitle "$backtitle" --title "$title" \
      --yesno "$question" $height $width
  local choice=$?
  clear

  if [ $choice -eq 0 ] ; then
    echo "\n====== $title - Audio Test ======"
    speaker-test --test wav --nloops 3 --channels 2
  fi
}

gstreamer_setup(){
  local title="GStreamer Setup"
  local question="Which version of GStreamer do you want to use?"

  local choice=$(dialog --backtitle "$backtitle" --title "$title" \
      --stdout --radiolist "$question" $height $width 5 \
      1 "GStreamer0.10" on\
      2 "GStreamer1.0" off)
  clear

  echo "\n====== $title - Install ======"
  if [ $choice -eq 1 ] ; then
    apt-get -y install libgstreamer0.10-dev \
      gstreamer0.10-tools gstreamer0.10-alsa \
      gstreamer0.10-plugins-base gstreamer0.10-plugins-good \
      gstreamer0.10-plugins-ugly gstreamer0.10-ffmpeg
  else
    apt-get -y -t wheezy-backports install \
      libgstreamer1.0-dev gstreamer1.0-alsa \
      gstreamer1.0-plugins-base gstreamer1.0-libav \
      gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly
  fi
}

gmrender_clone(){
  local title="Clone"
  echo "\n====== $title ======"

  if [ ! -d $folder ]
    then
      if [ command -v git >/dev/null 2>&1 ] ; then
        echo "Command 'git' not found. Installing ..."
        apt-get -y install git
      fi

      git clone http://github.com/hzeller/gmrender-resurrect.git $folder
    else
      echo "The folder '${folder}' already exists."
  fi
  echo "Done cloning ..."
}

gmrender_make(){
  local title="Make"
  echo "\n====== $title - Tools ======"
  apt-get -y install autoconf automake libtool libupnp-dev

  echo "\n====== $title - Run ======"
  if [ -x $folder/autogen.sh ] ; then
    cd $folder ; ./autogen.sh
    cd $folder ; ./configure
    make -C $folder
    make -C $folder install
  else
    echo "File '$folder/autogen.sh' not found or not executable."
  fi
}

# Main menu

auswahl=$(dialog --stdout --backtitle "$backtitle" \
  --checklist "What do you want to do?" $height $width 5 \
    "ALSA" "ALSA setup" off \
    "GStreamer" "GStreamer setup" off \
    "Clone" "Clone the git repository" off \
    "Make" "Make GMediaRender" off)
clear

for choice in $auswahl ; do
  case $choice in
    '"ALSA"')
      alsa_setup
      ;;
    '"GStreamer"')
      gstreamer_setup
      ;;
    '"Clone"')
      gmrender_clone
      ;;
    '"Make"')
      gmrender_make
      ;;
  esac
done

unset height ; unset width ; unset title ; unset folder
