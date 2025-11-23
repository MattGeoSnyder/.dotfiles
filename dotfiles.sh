#!/bin/bash

#Update package manager
apt update 
apt-get -y install build-essential

#Install zsh
apt install zsh

#Make default shell
chsh -s $(which zsh)

#Install tmux
apt install tmux

#Install additional utilities
apt install ripgrep
apt install xclip 
apt install dos2unix

#Install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo -e "export PATH="$PATH:/opt/nvim-linux64/bin"\n$(cat .zshrc)" > .zshrc 

#Download Dotfiles
git clone https://github.com/MattGeoSnyder/.dotfiles.git ~/.dotfiles

#symlink things to config paths
#link nvim
ln -s ./.config/nvim "$HOME"/.config
ln -s ./.config/tmux "$HOME"/.config
ln -s ./.config/zsh "$HOME"/.config
ln -s ./.fonts "$HOME"/.fonts

#Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
nvm install node

#aliases
alias tmux -f "$HOME"/.conf/tmux/tmux.conf;

