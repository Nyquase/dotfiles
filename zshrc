export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="nyquase"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions wd dirhistory vi-mode)

source $ZSH/oh-my-zsh.sh

###################### Vim mode ##################################
# In adition to oh-my-zsh vi-mode plugin

export KEYTIMEOUT=1

function select_cursor() {
  case $KEYMAP in
    # Block cursor in normal mode
    vicmd) echo -ne "\e[2 q";;
    # Line cursor in insert mode
    main|viins) echo -ne "\e[5 q";;
    *) echo -ne "\e[5 q";;
  esac
}

# When changing mode
function zle-keymap-select() {
  select_cursor
  zle reset-prompt
  zle -R
}

function zle-line-init() {
  echoti smkx
  select_cursor
}

# Reset to block cursor when executing a command,
# else it would be line cursor
function zle-line-finish() {
  echoti rmkx
  echo -ne "\e[2 q"
}

function vim_prompt() {
  NORMAL="%{$fg_bold[blue]%}NORMAL%{$reset_color%}"
  INSERT="%{$fg_bold[grey]%}INSERT%{$reset_color%}"
  case $KEYMAP in
    vicmd) echo $NORMAL;;
    main|viins) echo $INSERT;;
    *) echo $INSERT;;
  esac
  #echo "${${KEYMAP/vicmd/% $NORMAL %}/(main|viins)/% $INSERT %}"
}
RPS1='$(vim_prompt)'
RPS2=$RPS1

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Remap ctrl-U  to default behavior
bindkey "^U" kill-whole-line

##################################################################


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
