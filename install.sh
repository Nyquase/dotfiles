#! /bin/bash
# This script install the main programs i use, this is intended to work
# on the manjaro i3 community release
# Pacman easter-egg : write ILoveCandy after the miscellanneous settings in
# /etc/pacman.conf
# To activate pacman colors : uncomment 'Colors' in /etc/pacman.conf

sudo pacman -Syu
sudo pacman -S yay

git clone https://github.com/Nyquase/dotfiles.git

#i3
cp -r dotfiles/i3 ~/.config/

#DogeLock
sudo ln -s ~/dotfiles/dogelock/lock.sh /usr/bin/dogelock

# Terminal and shell
yay -S termite
yay -S nerd-fonts-source-code-pro
yay -S xcwd-git
yay -S exa
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp -r dotfiles/termite ~/.config/
sudo cp dotfiles/working_term.sh /usr/bin/working_term
cp dotfiles/zshrc ~/.zshrc
cp dotfiles/zsh_aliases ~/.zsh_aliases
cp dotfiles/nyquase.zsh-theme ~/.oh-my-zsh/themes/

# Vim / Neovim
yay -S neovim
yay -S python2-neovim
yay -S python-neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Program launcher
yay -S rofi
sudo rm -f /usr/bin/dmenu
sudo ln -s /usr/bin/rofi /usr/bin/dmenu
cp dotfiles/Xresources ~/.Xresources

# Dotfiles editing with dmenu
sudo cp dotfiles/dotsmenu.sh /usr/bin/dotsmenu.sh
cp dotfiles/mydotsindex ~/.mydotsindex

# Bar
yay -S polybar
yay -S awesome-terminal-fonts
cp -r dotfiles/polybar ~/.config/

# Sound
yay -S pa-applet

#Notifications
yay -S dunst
cp -r dotfiles/dunst ~/.config/

#Compositor (already installed on manjaro i3)
#yay -S compton
cp dotfiles/compton.conf ~/.config/

# Useful programs
yay -S firefox
yay -S bat
yay -S ripgrep
yay -S fd
yay -S feh

# 
yay -S python

# Misc
cp -r dotfiles/scripts ~/.config/
yay -S lxappearance
yay -S udisks2
yay -S thunar
