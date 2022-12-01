#!/bin/bash

# This script install the main programs i use, this is intended to work
# on the manjaro i3 community release
# ILoveCandy after the miscellanneous settings in /etc/pacman.conf
# Activate pacman colors: uncomment 'Colors' in /etc/pacman.conf

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;34m➜\033[0m  $@"; }

# Test if this script was run via the install.sh bin (vs. via curl/wget)
function is_install_script() {
  [[ "$(basename $0 2>/dev/null)" =~ install.sh ]] || return 1
}

# OS detection
function is_ubuntu() {
  [[ "$(cat /etc/os-release)" =~ Ubuntu ]] || return 1
}

if is_install_script; then
  export DOTFILES=$( cd $(dirname $0) && pwd)
else
  export DOTFILES=$HOME/.dotfiles
fi

# Config files
# Arrays are key/value of the form 
# "dotfiles-path" <=> "link name"
declare -A ln_files=(
  ["zsh/zshrc_ubuntu"]="$HOME/.zshrc"
  ["zsh/aliases.zsh"]="$HOME/.aliases.zsh"
  ["zsh/nyquase.zsh-theme"]="$HOME/.oh-my-zsh/custom/themes/nyquase.zsh-theme"
  ["nvim"]="$HOME/.config/nvim"
)

# Scripts that are gonna get linked into /usr/loca/bin (needs sudo)
declare -A bin_scripts=(
  ["bin/clipboard_screenshot.sh"]="/usr/local/bin/clipboard_screenshot"
)

install="sudo apt-get install -y"

function is_font_installed() {
    fc-list | grep -i "$1" >/dev/null
}

function install_fonts() {
  e_header "Fonts"

  $install fonts-powerline fonts-firacode
  mkdir -p $HOME/.local/share/fonts
  install_nerds_fonts
  install_saucecodepro
  install_jetbrains_mono
  fc-cache -f -v
}

function install_nerds_fonts() {
  if is_font_installed MesloLGS; then
    return
  fi
  e_header "Downloading MesLoLGS fonts"
  wget -q "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf" -P $HOME/.local/share/fonts && e_success "Installed MesloLGS"
}

function install_saucecodepro() {
  if is_font_installed SauceCodePro; then
    return
  fi
  e_header "Downloading SourceCodePro font"
  ZIP_FILE=SauceCodePro.zip
  wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/$ZIP_FILE" && \
    unzip $ZIP_FILE -d $HOME/.local/share/fonts && \
    e_success "Installed SourceCodePro"
  rm $ZIP_FILE
}

function install_jetbrains_mono() {
  if is_font_installed JetBrainsMono; then
    return
  fi
  e_header "Downloading JetBrainsMono font"
  ZIP_FILE="JetBrainsMono-2.242.zip"
  wget -q "https://download.jetbrains.com/fonts/$ZIP_FILE" && \
    unzip $ZIP_FILE -d $HOME/.local/share/fonts && \
    e_success "Installed JetBrains Mono"
  rm $ZIP_FILE
}


function install_packages() {
  e_header "Upgrading packages"
  sudo apt-get update -y
  sudo apt-get upgrade -y

  e_header "Curl"
  $install curl

  e_header "Neovim"
  $install neovim

  e_header "Exa"
  $install exa

  e_header "Shell and plugins"
  $install zsh
  $install gawk # For zplug
  curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  [[ ! -d "$HOME/.zplug" ]] && \
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  chsh --shell=/usr/bin/zsh

  e_header "Rust utils"
  $install cargo cmake
  cargo install bat

  e_header "Gnome shell extension manager"
  $install gnome-shell-extension-manager
}

backup_dir="$DOTFILES/backups/$(date "+%Y-%m-%d_%Hh%Mm%Ss")/"
backup=

function install_config() {
  e_header "Installing dotfiles" 
  for file in ${!ln_files[@]}; do
    path="$(realpath $file)"
    dest="${ln_files[$file]}"
    if [[ -h $dest ]] && [[ "$(readlink $dest)" == "$path" ]]; then
      continue
    fi
    # Destination file already exists. Back it up!
    if [[ -e "$dest" ]]; then
      e_arrow "Backing up \033[1;32m$dest\033[0m."
      # Set backup flag, so a nice message can be shown at the end.
      backup=1
      # Create backup dir if it doesn't already exist.
      [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
      # Backup file / link / whatever.
      mv "$dest" "$backup_dir"
    fi
    e_arrow "Linking \033[1;32m$path\033[0m to \033[1;32m$dest\033[0m."
    ln -fs "$path" "$dest"
  done
  for file in ${!bin_scripts[@]}; do
    path="$(realpath $file)"
    dest="${bin_scripts[$file]}"
    if [[ -h $dest ]] && [[ "$(readlink $dest)" == "$path" ]]; then
      continue
    fi
    if [[ -e "$dest" ]]; then
      e_arrow "Backing up \033[1;32m$dest\033[0m."
      backup=1
      [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
      sudo mv "$dest" "$backup_dir"
    fi
    e_arrow "Linking \033[1;32m$path\033[0m to \033[1;32m$dest\033[0m."
    sudo ln -fs "$path" "$dest"
  done

  e_header "Installing zsh plugins"
  zsh -c "source ~/.zplug/init.zsh && zplug install"

  e_header "Installing vim plugins"
  nvim +PlugInstall +qall

  e_header "Gnome Terminal Helios profile"
  ./scripts/base16-helios.sh

  # Alert if backups were made.
  if [[ "$backup" ]]; then
    echo -e "\nBackups were moved to ${backup_dir}"
  fi
}

if [[ ! "$(type -P git)" ]]; then
  e_header "Installing Git"
  $install git
fi

if [[ ! -d $DOTFILES ]] && ! is_install_script; then
  e_header "Dowloading dotfiles..."
  git clone https://github.com/nyquase/dotfiles.git "$DOTFILES"
fi

cd $DOTFILES

case "$1" in
  "help"|"-h"|"--help" )
    cat <<HELP
An installation helper script.
  Usage:
    ./install.sh [config|update]
    
    No args     Download and install dependencies and config files
    packages    Only download dependencies
    dotfiles    Only install (links) configuration files
    update      git pull and reinstall config if new files
HELP
  exit
  ;;
  "packages" )
    if is_ubuntu; then
      install_packages
    fi
  ;;
  "dotfiles" )
    install_config
  ;;
  "update" )
    prev_head="$(git rev-parse HEAD)"
    git pull
    exec "$0"
  ;;
  "" )
    e_header "Configuration dependencies will be installed before config files"
    if is_ubuntu; then
      install_packages
    fi
    install_config
  ;;
esac

e_header "Done !"

## TODO : 
## Files to be copied instead of linked
## Switch case for os choice and get_os func
