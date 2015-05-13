#!/bin/sh

sudo -i
sudo apt-get update
sudo apt-get -y install build-essential cmake git emacs emacs-goodies-el pymacs pyflakes vim screen gitk skype dropbox python python-pip audacious vlc flashplugin-installer texlive-full texmaker pinta wally nvidia-331 nvidia-prime nvidia-settings
sudo apt-get -y upgrade

sudo pip install ropemacs

wget http://www.rainlendar.net/download/rainlendar2-lite_2.12.2.b138-1_amd64.deb -O rainlendar.deb
sudo dpkg -i rainlendar.deb
rm rainlendar.deb

cp .bashrc ~/
cp .gitconfig ~/
cp .vimrc ~/
cp .emacs ~/
