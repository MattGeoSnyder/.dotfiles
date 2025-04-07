#!/bin/bash

#Update package manager
apt update 
apt-get -y install build-essential

#Install curl
apt install curl

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

#Install Git
apt install git-all

#Download Dotfiles
git clone https://github.com/MattGeoSnyder/.dotfiles.git ~/.dotfiles

#Install Perl
curl -L http://xrl.us/installperlinx | bash

#Install stow
cd .dotfiles
curl -LO https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzf stow-latest.tar.gz && rm stow-latest.tar.gz
cd $( find . -maxdepth 1 -name 'stow-*' )
./configure
make install
stow .
cd

#Install tpm (tmux package manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
nvm install node

#Install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo -e "export PATH="$PATH:/opt/nvim-linux64/bin"\n$(cat .zshrc)" > .zshrc 

