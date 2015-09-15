#!/bin/sh

BASEDIR=$(pwd)

cd ../home
./setup.sh
cd $BASEDIR

sudo apt-get install -y nautilus-open-terminal
