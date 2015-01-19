#!/bin/sh

gmrender_clone(){
  echo "\n====== Cloning git repository ======"
  if [ ! -d ~/gmrender-resurrect ]
    then
      if [ ! -x git ] ; then
        echo "Command 'git' not found. Installing ..."
        apt-get -y install git
      fi

      cd ~ ; git clone http://github.com/hzeller/gmrender-resurrect.git
    else
      echo "The folder 'gmrender-resurrect' already exists."
  fi
  echo "Done cloning ...\n"
}

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
      gmrender_clone ;;

    '"Make"')
      echo "Make ..."
      ;;
  esac
done
