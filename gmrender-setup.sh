#!/bin/sh

# GMediaRender - Setup

# Installing tools
echo "\n\t====== Installing tools ======\n"
apt-get install git autoconf automake libtool libupnp-dev

# Cloning git repository
if [ ! -d ~/gmrender-resurrect ] ; then
    echo "\n\t====== Cloning git ======\n"
    cd ~ ; git clone http://github.com/hzeller/gmrender-resurrect.git
fi

# Installing gmediarenderer
echo "\n\t====== Installing renderer ======\n"
cd ~/gmrender-resurrect ; ./autogen.sh ; ./configure ; make ; make install
