#!/bin/sh

BASEDIR=$(pwd)

cd ../home-shared
./setup.sh
cd $BASEDIR

sudo apt-get install -y nautilus-open-terminal
