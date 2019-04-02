#!/bin/bash

# This script install the main programs i use
# This script is aimed at any Ubuntu / Debian based distribution, i use it on Ubuntu GNOME 18.10
# Gnome Tweaks is a very useful tool to personalize your desktop environment and other settings like font

sudo apt-get update
sudo apt-get upgrade

# Terminal and shell
sudo apt-get install zsh fonts-powerline
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
cp ./zshrc ~/.zshrc
cp ./zsh_aliases ~/.zsh_aliases
cp ./nyquase.zsh-theme ~/.oh-my-zsh/custom/themes/
zplug install
chsh --shell=/usr/bin/zsh

# Vim / Neovim
cp -r ./nvim ~/.config/
ln -s ~/.config/nvim/init.vim ~/.vimrc
sudo apt-get install neovim python-neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Basics / Misc
sudo apt-get install gnome-tweaks gnome-tweak-tool neofetch fonts-firacode
sudo apt-get install cmake valgrind

# Rust holy binaries
sudo apt-get install cargo
cargo install exa bat fd-find ripgrep

# Screenshot to clipboard script
sudo apt-get install maim xclip
sudo cp ./clipboard_screenshot.sh /usr/bin/clipboard_screenshot

# DogeLock
# In order to dogelock to work, this repository must be located at ~
sudo apt-get install i3lock scrot
sudo cp dogelock/lock.sh /usr/bin/dogelock

