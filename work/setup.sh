#!/bin/sh

sudo apt-get update
sudo apt-get install build-essential cmake git emacs emacs-goodies-el pymacs pyflakes vim screen gitk
sudo apt-get -y upgrade

cp .bashrc ~/
cp .gitconfig ~/
cp .vimrc ~/
cp .emacs ~/
cp .sqliterc ~/
