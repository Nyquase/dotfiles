export ZSH=$HOME/.oh-my-zsh

# $TERM_PROGRAM is set when in Jetbrain IDE's term
# $TERMINAL_EMULATOR is set when in Vscode's term
if [ -z $TERM_PROGRAM ] && [ -z $TERMINAL_EMULATOR ]; then
  ZSH_THEME="nyquase"
else
  ZSH_THEME="robbyrussell"
fi

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  wd
  zsh-vimode-visual
  vi-mode
)

source $ZSH/oh-my-zsh.sh

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
