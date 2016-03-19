#!/bin/sh

MYUSER=$(whoami)
MYHOME=/home/$MYUSER

sudo apt-get update
sudo apt-get -y install build-essential cmake git vim screen gitk skype dropbox python python-pip audacious vlc flashplugin-installer pinta nvidia-331 nvidia-prime nvidia-settings openjdk-7-jdk geany
# emacs emacs-goodies-el pymacs pyflakes
sudo apt-get -y upgrade

# sudo pip install ropemacs

wget http://www.rainlendar.net/download/rainlendar2-lite_2.12.2.b138-1_amd64.deb -O rainlendar.deb
sudo dpkg -i rainlendar.deb
rm rainlendar.deb

wget http://ftp.snt.utwente.nl/pub/software/eclipse//technology/epp/downloads/release/mars/R/eclipse-java-mars-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
sudo tar xzf eclipse.tar.gz -C "$MYHOME"
rm eclipse.tar.gz

wget http://downloads.sourceforge.net/project/cmakeed/CMakeEd-1.1.6.zip
unzip CMakeEd-1.1.6.zip
sudo mv CMakeEd-1.1.6/plugins/* "$MYHOME/eclipse/plugins/"
sudo mv CMakeEd-1.1.6/features/* "$MYHOME/eclipse/features/"
rm -rf CMakeEd-1.1.6.zip CMakeEd-1.1.6

cp .bashrc ~/
cp .gitconfig ~/
cp .vimrc ~/
cp .emacs ~/
mkdir -p ~/.local/share/applications/
cp *.desktop ~/.local/share/applications/
