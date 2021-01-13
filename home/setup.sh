#!/bin/bash -e

sudo add-apt-repository -y ppa:seafile/seafile-client
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen \
    python3 python3-pip python3-pylint virtualenv \
    vlc easytag pinta \
    openjdk-8-jdk \
    openvpn network-manager-openvpn-gnome bmon \
    texlive-full texstudio unzip \
    seafile-gui skype
sudo apt-get -y upgrade

BASE_DIR=$(cd $(dirname "$1") && pwd)
HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/Applications"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="https://www.rainlendar.net/download/rainlendar2-pro_2.15.4.b166-1_amd64.deb"
BITWARDEN_URL="https://github.com/bitwarden/desktop/releases/download/v1.23.1/Bitwarden-1.23.1-x86_64.AppImage"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
sudo gdebi -n rainlendar.deb
rm rainlendar.deb

# Bitwarden
BITWARDEN_DIR="$PROGRAMS_DIR/Bitwarden"
mkdir -p "$BITWARDEN_DIR"
wget "$BITWARDEN_URL" -O "$BITWARDEN_DIR/Bitwarden"
cp "$BASE_DIR/Bitwarden.png" "$BITWARDEN_DIR"

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
