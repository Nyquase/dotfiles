#-*- mode: sh-*-
export ZSH=/home/nyquase/.oh-my-zsh

#Because Agnoster's like powerline font is ugly in Jetbrains IDE's terminals
if [[ "$TERM" = "xterm-termite" ]]; then
    ZSH_THEME="nyquase"
else
    ZSH_THEME="robbyrussell"
fi

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#Much export such wow
export LC_ALL=en_US.UTF_8
export USER_NICKNAME=Nyquase
export TEKUSER=adrien.rouhete@epitech.eu
export PATH="$PATH:/home/nyquase/.cargo/bin"
export PATH="$PATH:/home/nyquase/.local/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#For linking .o from asm
export LDEMULATION=elf_x86_64

if command -v nvim > /dev/null 2>&1; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi


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

# Android
export PATH=~/Android/Sdk/tools:$PATH
export PATH=~/Android/Sdk/platform-tools:$PATH

# redefine prompt_context for hiding user@hostname
#prompt_context () { }

# Vim mode
#bindkey -v
#
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward
#
#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

source ~/.zsh_aliases
