#!/bin/bash -e

sudo add-apt-repository -y ppa:seafile/seafile-client
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen  \
    python3 python3-pip python3-flake8 virtualenv \
    vlc easytag pinta \
    openjdk-8-jdk mono-complete \
    openvpn network-manager-openvpn-gnome bmon \
    texlive-full texstudio unzip \
    seafile-gui atom 
sudo apt-get -y upgrade

HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/Applications"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="https://www.rainlendar.net/download/rainlendar2-pro_2.15.1.b163-1_amd64.deb"
BITWARDEN_URL="https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage"

git clone "https://github.com/Rookfighter/atom-settings.git" "$HOME_DIR/.atom"
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


cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
