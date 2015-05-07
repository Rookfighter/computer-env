#!/bin/sh

sudo apt-get update
sudo apt-get install build-essential cmake git emacs emacs-goodies-el vim screen gitk skype dropbox python audacious vlc flashplugin-installer texlive-full texmaker pinta wally
#sudo apt-get install nvidia-331 nvidia-prime nvidia-cg-toolkit nvidia-settings
sudo apt-get upgrade

wget http://www.rainlendar.net/download/rainlendar2-lite_2.12.2.b138-1_amd64.deb -O rainlendar.deb
sudo dpkg -i rainlendar.deb
rm rainlendar.deb

cp .bashrc ~/
cp .gitconfig ~/
cp .vimrc ~/
cp .emacs ~/
