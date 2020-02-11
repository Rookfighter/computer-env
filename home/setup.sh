#!/bin/bash -e

sudo add-apt-repository -y ppa:seafile/seafile-client
sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen  \
    python3 python3-pip python3-flake8 virtualenv \
    vlc easytag pinta \
    openjdk-8-jdk mono-complete \
    openvpn network-manager-openvpn-gnome bmon \
    texlive-full texstudio unzip \
    seafile-gui skype
sudo apt-get -y upgrade

BASE_DIR=$(cd $(dirname "$1") && pwd)
HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/Applications"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="https://www.rainlendar.net/download/rainlendar2-pro_2.15.1.b163-1_amd64.deb"
BITWARDEN_URL="https://github.com/bitwarden/desktop/releases/download/v1.16.6/Bitwarden-1.16.6-amd64.deb"
ATOM_URL="https://github.com/atom/atom/releases/download/v1.43.0/atom-amd64.deb"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
sudo gdebi -n rainlendar.deb
rm rainlendar.deb

# Rainlendar
wget "$BITWARDEN_URL" -O bitwarden.deb
sudo gdebi -n bitwarden.deb
rm bitwarden.deb

# Atom
wget "$ATOM_URL" -O atom.deb
sudo gdebi -n atom.deb
rm atom.deb

if [ ! -d "$HOME_DIR/.atom" ]
then
    git clone "https://github.com/Rookfighter/atom-settings.git" "$HOME_DIR/.atom"
    cd "$HOME_DIR/.atom"
    ./package.sh install
    cd "$BASE_DIR"
fi

cat .bashrc >> "$HOME_DIR/.bashrc"
cp .gitconfig "$HOME_DIR"
cp .vimrc "$HOME_DIR"

# Desktop files
#mkdir -p "$DESKTOP_DIR"
#cp *.desktop "$DESKTOP_DIR"
#sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop
