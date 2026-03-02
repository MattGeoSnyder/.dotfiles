#!/bin/bash

#!/usr/bin/env bash
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run with sudo or as root." >&2
  exit 1
fi

#Update package manager
apt update
apt-get -y install build-essential

#Install zsh
apt install -y zsh

#Make default shell
chsh -s $(which zsh)

#symlink zsh env
ln -s "$HOME"/.config/zsh/.zshenv "$HOME"/.zshenv

#Install tmux
apt install -y tmux

#Install nvim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.appimage
chmod u+x nvim-linux-arm64.appimage
mkdir -p /opt/nvim
mv nvim-linux-arm64.appimage /opt/nvim/nvim

#Install additional utilities
apt install -y ripgrep
apt install -y xclip
apt install -y dos2unix
apt install -y fzf
apt install -y bat

#Copy config files
cp -r ./.config/* "$HOME"/.config/
cp ./.fonts/* "$HOME"/.fonts/

