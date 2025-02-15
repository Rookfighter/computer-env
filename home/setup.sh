#!/bin/bash -e

sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen \
    python3 python3-pip virtualenv \
    vlc easytag \
    bmon curl wget htop \
    texlive-full texstudio unzip
sudo apt-get -y upgrade

BASE_DIR=$(cd $(dirname "$1") && pwd)
HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/.local/opt"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
RAINLENDAR_URL="https://www.rainlendar.net/download/2.21.3/rainlendar2-pro_2.21.3.b180-1_amd64.deb"
BITWARDEN_URL="https://github.com/bitwarden/clients/releases/download/desktop-v2024.10.2/Bitwarden-2024.10.2-x86_64.AppImage"
ZOTERO_URL="https://download.zotero.org/client/release/7.0.9/Zotero-7.0.9_linux-x86_64.tar.bz2"
NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
sudo gdebi -n rainlendar.deb
rm rainlendar.deb

# NVIM
wget "$NVIM_URL" -O nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
cp -r nvim-linux64/bin "$HOME_DIR/.local"
cp -r nvim-linux64/lib "$HOME_DIR/.local"
cp -r nvim-linux64/share "$HOME_DIR/.local"
rm -r nvim-linux64.tar.gz nvim-linux64

# Bitwarden
BITWARDEN_DIR="$PROGRAMS_DIR/Bitwarden"
mkdir -p "$BITWARDEN_DIR"
wget "$BITWARDEN_URL" -O "$BITWARDEN_DIR/Bitwarden"
chmod +x "$BITWARDEN_DIR/Bitwarden"
cp "$BASE_DIR/Bitwarden.png" "$BITWARDEN_DIR"

# Zotero
ZOTERO_DIR="$PROGRAMS_DIR/Zotero"
rm -rf "$ZOTERO_DIR"
wget "$ZOTERO_URL" -O zotero.tar.bz2
tar -xjf "zotero.tar.bz2" -C "$PROGRAMS_DIR"
mv "$PROGRAMS_DIR/Zotero_linux-x86_64" "$ZOTERO_DIR"
cp "$BASE_DIR/Zotero.png" "$ZOTERO_DIR"
rm zotero.tar.bz2

# NVIM_CONFIG_DIR="$HOME_DIR/.config/nvim"

# cat "$BASE_DIR/.bashrc" >> "$HOME_DIR/.bashrc"
# cp "$BASE_DIR/.gitconfig" "$HOME_DIR"
# cp "$BASE_DIR/.vimrc" "$HOME_DIR"
# mkdir -p "$NVIM_CONFIG_DIR"
# cp "$BASE_DIR/init.vim" "$NVIM_CONFIG_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop

