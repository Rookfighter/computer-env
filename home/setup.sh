#!/bin/bash -e

sudo add-apt-repository -y ppa:seafile/seafile-client
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen  \
    python3 python3-pip python3-flake8 virtualenv \
    clementine vlc easymp3gain-gtk easytag pinta \
    openjdk-8-jdk mono-complete \
    openvpn network-manager-openvpn-gnome bmon \
    texlive-full texstudio virtualbox keepass2 unzip \
    seafile-gui atom
sudo apt-get -y upgrade

HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/opt"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="http://www.rainlendar.net/download/rainlendar2-pro_2.14.2.b157-1_amd64.deb"
ANKI_URL="https://apps.ankiweb.net/downloads/archive/anki-2.0.36.deb"

git clone https://github.com/Rookfighter/atom-settings.git "$HOME_DIR/.atom"
cd "$HOME_DIR/.atom"
./package.sh install
cd "$HOME_DIR"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
set +e
sudo dpkg -i rainlendar.deb
set -e
rm rainlendar.deb
sudo apt-get -y install -f

# Anki Flashcards
wget "$ANKI_URL" -O anki.deb
set +e
sudo dpkg -i anki.deb
set -e
rm anki.deb
sudo apt-get -y install -f

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"
cp .emacs "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
