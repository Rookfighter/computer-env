#!/bin/bash -e

sudo apt-get update
sudo apt-get -y install build-essential cmake git autoconf vim screen gitk python3 python3-pip meld unzip libboost-all-dev libeigen3-dev libflann-dev libopenni-dev libqhull-dev libqglviewer-dev freeglut3-dev qt4-default libqt4-dev qtchooser qt4-designer libkdtree++-dev tmux 
sudo apt-get -y upgrade

CURR_DIR="$(pwd)"
HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/opt"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# Atom Editor
git clone "https://github.com/Rookfighter/atom-settings.git" "$HOME_DIR/.atom"
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install atom
cd "$HOME_DIR/.atom"
./package.sh install
cd "$CURR_DIR"

# ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get -y install ros-indigo-desktop-full

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"

