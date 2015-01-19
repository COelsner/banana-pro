#!/bin/sh

title="GMediaRender Setup for Banana Pi"

auswahl=$(dialog --stdout --title "$title" \
    --checklist "What do you want to do?" 16 60 5 \
	"ALSA" "ALSA setup" off \
        "GStreamer" "GStreamer setup" off \
	"Clone" "Clone the git repository" off \
	"Make" "Make GMediaRender" off)

for choice in $auswahl ; do
  case $choice in
    '"ASLA"')
      ./scripts/alsa-setup.sh 
      ;;
    '"GStreamer"')
      echo "GStreamer setup ..."
      ;;
    '"Clone"')
      echo "Cloning ..."
      ;;
    '"Make"')
      echo "Make ..."
      ;;
  esac
done
