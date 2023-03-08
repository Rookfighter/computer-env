#!/bin/bash -e

sudo apt-get update
sudo apt-get -y install \
    build-essential cmake git gitk meld autoconf vim screen \
    python3 python3-pip python3-pylint virtualenv \
    vlc easytag pinta \
    bmon curl wget htop \
    texlive-full texstudio unzip
sudo apt-get -y upgrade

BASE_DIR=$(cd $(dirname "$1") && pwd)
HOME_DIR="/home/$(whoami)"
PROGRAMS_DIR="$HOME_DIR/.local/opt"
DESKTOP_DIR="$HOME_DIR/.local/share/applications"

# URLs
VSCODE_URL="https://az764295.vo.msecnd.net/stable/5235c6bb189b60b01b1f49062f4ffa42384f8c91/code_1.74.0-1670260027_amd64.deb"
RAINLENDAR_URL="https://www.rainlendar.net/download/2.18.0/rainlendar2-pro_2.18.0.b171-1_amd64.deb"
BITWARDEN_URL="https://github.com/bitwarden/clients/releases/download/desktop-v2023.2.0/Bitwarden-2023.2.0-amd64.deb"
ZOTERO_URL="https://download.zotero.org/client/release/6.0.22/Zotero-6.0.22_linux-x86_64.tar.bz2"
NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb"
BUILD2_URL="https://stage.build2.org/0/0.16.0-a.0/build2-install-0.16.0-a.0-stage.sh"

mkdir -p "$PROGRAMS_DIR"

# Rainlendar
wget "$RAINLENDAR_URL" -O rainlendar.deb
sudo gdebi -n rainlendar.deb
rm rainlendar.deb

# VS Code
wget "$RAINLENDAR_URL" -O vscode.deb
sudo gdebi -n vscode.deb
rm vscode.deb

# NVIM
wget "$NVIM_URL" -O nvim.deb
sudo gdebi -n nvim.deb
rm nvim.deb

# Bitwarden
wget "$BITWARDEN_URL" -O Bitwarden.deb
sudo gdebi -n Bitwarden.deb
rm Bitwarden.deb

# Zotero
ZOTERO_DIR="$PROGRAMS_DIR/Zotero"
mkdir -p "$ZOTERO_DIR"
wget "$ZOTERO_URL" -O zotero.tar.bz2
tar -xjf "zotero.tar.bz2" -C "$ZOTERO_DIR"
cp "$BASE_DIR/zotero.png" "$ZOTERO_DIR"
rm zotero.tar.bz2

NVIM_CONFIG_DIR="$HOME_DIR/.config/nvim"

cat "$BASE_DIR/.bashrc" >> "$HOME_DIR/.bashrc"
cp "$BASE_DIR/.gitconfig" "$HOME_DIR"
cp "$BASE_DIR/.vimrc" "$HOME_DIR"
mkdir -p "$NVIM_CONFIG_DIR"
cp "$BASE_DIR/init.vim" "$NVIM_CONFIG_DIR"

# Desktop files
mkdir -p "$DESKTOP_DIR"
cp *.desktop "$DESKTOP_DIR"
sed -i 's|##PROGRAMS_DIR##|'$PROGRAMS_DIR'|g' "$DESKTOP_DIR/"*.desktop

# Build2
BUILD2_DIR="$HOME_DIR/Downloads/build2-build"
mkdir -p "$BUILD2_DIR"
cd "$BUILD2_DIR"
wget "$BUILD2_URL" -O build2-install.sh
sh build2-install.sh --local
