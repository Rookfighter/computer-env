#!/bin/sh

sudo apt-get update
sudo apt-get -y install build-essential git emacs emacs-goodies-el pymacs pyflakes vim screen gitk meld libcurl4-openssl-dev sqlite3 mysql-client mysql-server lua5.1 luarocks libjson0-dev
sudo apt-get -y upgrade

sudo luarocks install busted
sudo luarocks install luacheck
sudo luarocks install luasocket
sudo luarocks install luaposix

cp .bashrc ~/
cp .gitconfig ~/
cp .vimrc ~/
cp .emacs ~/
cp .sqliterc ~/
