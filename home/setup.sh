#!/bin/bash -e

sudo apt-get update
sudo apt-get -y install build-essential cmake git autoconf vim screen gitk skype dropbox python3 python3-pip audacious vlc flashplugin-installer pinta openjdk-8-jdk mono-runtime openvpn network-manager-openvpn-gnome dia easymp3gain-gtk easytag texlive-full texstudio virtualbox keepass2 meld
sudo apt-get -y upgrade

HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/Programs"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget http://www.rainlendar.net/download/rainlendar2-lite_2.12.2.b138-1_amd64.deb -O rainlendar.deb
set +e
sudo dpkg -i rainlendar.deb
set -e
rm rainlendar.deb
sudo apt-get -y install -f

# Atom Editor
wget https://atom.io/download/deb -O atom.deb
set +e
sudo dpkg -i atom.deb
set -e
rm atom.deb
sudo apt-get -y install -f

# Anki Flashcards
wget http://ankisrs.net/download/mirror/anki-2.0.36.deb -O anki.deb
set +e
sudo dpkg -i anki.deb
set -e
rm anki.deb
sudo apt-get -y install -f

# Eclipse
ECLIPSE_ROOT="$PROGRAMS_DIR/eclipse"
wget "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/R/eclipse-java-neon-R-linux-gtk-x86_64.tar.gz&r=1" -O eclipse.tar.gz
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

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"
cp .emacs "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
