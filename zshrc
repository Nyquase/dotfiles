export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="nyquase"

# Oh My Zsh plugins
plugins=(
  git
  wd
)

source $ZSH/oh-my-zsh.sh
source ~/.zplug/init.zsh

zplug "nyquase/vi-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

#Much export such wow
export LC_ALL=en_US.UTF_8
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

if command -v nvim > /dev/null 2>&1; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

export EXA_COLORS="di=1;34"

export MANPAGER='less -s -M +Gg'


# fg when pressing Ctrl+Z
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    if [[ $(jobs | wc -l) -gt 0 ]]; then
      BUFFER='fg'
      zle accept-line
    fi
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

setxkbmap fr
setxkbmap -option caps:escape
xset r rate 200 30

# redefine prompt_context for hiding user@hostname
#prompt_context () { }

#Android studio
export PATH=$PATH:$HOME/Android/Sdk/emulator
export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/Android/Sdk/tools/bin

function npm() {
  if [ -z $NVM_DIR ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  fi
  $NVM_BIN/npm $@
}

source ~/.zsh_aliases
