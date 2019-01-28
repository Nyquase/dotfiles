#! /bin/bash
# This script install the main programs i use, this is intended to work
# on the manjaro i3 community release
# Pacman easter-egg : write ILoveCandy after the miscellanneous settings in
# /etc/pacman.conf
# To activate pacman colors : uncomment 'Colors' in /etc/pacman.conf

sudo pacman -Syu
sudo pacman -S yay

#i3
cp -r ./i3 ~/.config/

# DogeLock
# In order to dogelock to work, this repository must be located at ~
sudo cp dogelock/lock.sh /usr/bin/dogelock

# Terminal and shell
yay -S termite
yay -S nerd-fonts-source-code-pro
yay -S xcwd-git
yay -S exa
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp -r ./termite ~/.config/
sudo cp ./working_term.sh /usr/bin/working_term
yay -S zsh
cp ./zshrc ~/.zshrc
cp ./zsh_aliases ~/.zsh_aliases
cp ./nyquase.zsh-theme ~/.oh-my-zsh/themes/
chsh --shell=/usr/bin/zsh

# Vim / Neovim
cp -r ./nvim ~/.config/
ln -s ~/.config/nvim/init.vim ~/.vimrc
yay -S neovim
yay -S python2-neovim
yay -S python-neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Program launcher
yay -S rofi
sudo rm -f /usr/bin/dmenu
sudo ln -s /usr/bin/rofi /usr/bin/dmenu
cp ./Xresources ~/.Xresources

# . editing with dmenu
sudo cp ./dotsmenu.sh /usr/bin/dotsmenu.sh
cp ./mydotsindex ~/.mydotsindex

# Bar
yay -S polybar
yay -S awesome-terminal-fonts
cp -r ./polybar ~/.config/

# Sound
yay -S pa-applet

#Notifications
yay -S dunst
cp -r ./dunst ~/.config/

#Compositor (already installed on manjaro i3)
#yay -S compton
cp ./compton.conf ~/.config/

# Useful programs
yay -S firefox
yay -S bat
yay -S ripgrep
yay -S fd
yay -S feh

# 
yay -S python

# Misc
cp -r ./scripts ~/.config/
yay -S lxappearance
yay -S udisks2
yay -S xorg-xbacklight
yay -S thunar
