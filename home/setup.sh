#!/bin/bash -e

sudo apt-get update
sudo apt-get -y install build-essential cmake git autoconf vim screen gitk skype python3 python3-pip audacious vlc flashplugin-installer pinta openjdk-8-jdk mono-complete openvpn network-manager-openvpn-gnome dia easymp3gain-gtk easytag texlive-full texstudio virtualbox keepass2 meld unzip
sudo apt-get -y upgrade

HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/opt"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="http://www.rainlendar.net/download/rainlendar2-pro_2.13.1.b147-1_amd64.deb"
ANKI_URL="http://ankisrs.net/download/mirror/anki-2.0.36.deb"
ECLIPSE_URL="http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz"
CMAKEED_URL="http://downloads.sourceforge.net/project/cmakeed/CMakeEd-1.1.6.zip"
UMLET_URL="http://www.umlet.com/umlet_14_2/umlet-standalone-14.2.zip"
ZEROK_URL="http://zero-k.info/lobby/Chobby.exe"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
set +e
sudo dpkg -i rainlendar.deb
set -e
rm rainlendar.deb
sudo apt-get -y install -f

# Seafile
sudo add-apt-repository ppa:seafile/seafile-client
sudo apt-get update
sudo apt-get -y install seafile-gui

# Atom Editor
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install atom

# Anki Flashcards
wget "$ANKI_URL" -O anki.deb
set +e
sudo dpkg -i anki.deb
set -e
rm anki.deb
sudo apt-get -y install -f

# Eclipse
ECLIPSE_ROOT="$PROGRAMS_DIR/eclipse"
wget "$ECLIPSE_URL" -O eclipse.tar.gz
tar xzf eclipse.tar.gz -C "$PROGRAMS_DIR"
rm eclipse.tar.gz

# Eclipse CMakeEd
wget "$CMAKEED_URL" -O CMakeEd.zip
unzip CMakeEd.zip
mv "CMakeEd-1.1.6" "CMakeEd"
mv CMakeEd/plugins/* "$ECLIPSE_ROOT/plugins/"
mv CMakeEd/features/* "$ECLIPSE_ROOT/features/"
rm -rf CMakeEd.zip CMakeEd

# Umlet
wget "$UMLET_URL" -O umlet.zip
unzip umlet.zip
mv Umlet "$PROGRAMS_DIR/umlet"
rm umlet.zip

# Zero-K
mkdir -p "$PROGRAMS_DIR/zero-k"
wget "$ZEROK_URL"
mv Chobby.exe "$PROGRAMS_DIR/zero-k"

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"
cp .emacs "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
