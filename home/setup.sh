#!/bin/sh

sudo apt-get update
sudo apt-get -y install build-essential cmake git vim screen gitk skype dropbox python python-pip audacious vlc flashplugin-installer pinta nvidia-361 nvidia-prime nvidia-settings openjdk-9-jdk mono-runtime openvpn network-manager-openvpn-gnome dia easymp3gain-gtk easytag
sudo apt-get -y upgrade

# sudo pip install ropemacs

HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/Programs"
PROGRAMS_DIR_ESC=$(echo "$HOME_DIR" | tr '/' '\/ ')
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget http://www.rainlendar.net/download/rainlendar2-lite_2.12.2.b138-1_amd64.deb -O rainlendar.deb
sudo dpkg -i rainlendar.deb
rm rainlendar.deb

# Eclipse
ECLIPSE_ROOT="$PROGRAMS_DIR/eclipse"
wget http://ftp.snt.utwente.nl/pub/software/eclipse//technology/epp/downloads/release/mars/R/eclipse-java-mars-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
tar xzf eclipse.tar.gz -C "$PROGRAMS_DIR"
rm eclipse.tar.gz

# Eclipse CMakeEd
wget http://downloads.sourceforge.net/project/cmakeed/CMakeEd-1.1.6.zip
unzip CMakeEd-1.1.6.zip
mv CMakeEd-1.1.6/plugins/* "$ECLIPSE_ROOT/plugins/"
mv CMakeEd-1.1.6/features/* "$ECLIPSE_ROOT/features/"
rm -rf CMakeEd-1.1.6.zip CMakeEd-1.1.6

# Umlet
wget http://www.umlet.com/umlet_14_2/umlet-standalone-14.2.zip
unzip umlet-standalone-14.2.zip
mv Umlet "$PROGRAMS_DIR"
rm umlet-standalone-14.2.zip

# Zero-K
mkdir -p "$PROGRAMS_DIR/zero-k"
wget http://zero-k.info/lobby/Zero-K.exe
mv Zero-K.exe "$PROGRAMS_DIR/zero-k"

cp .bashrc "$HOME_DIR"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"
cp .emacs "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i "s/##PRGRAMS_DIR##/$PROGRAMS_DIR_ESC/g" "$DESKTOP_DIR/*.desktop"
