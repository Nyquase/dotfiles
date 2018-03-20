#-*- mode: sh-*-
export ZSH=/home/nyquase/.oh-my-zsh

if [[ "$TERM" = "xterm-termite" ]]; then
    ZSH_THEME="nyquase"
else
    ZSH_THEME="robbyrussell"
fi

# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize tmux)

source $ZSH/oh-my-zsh.sh

#Much export such wow
export LC_ALL=en_US.UTF_8
export USER_NICKNAME=Nyquase
export TEKUSER=adrien.rouhete@epitech.eu
#For linking .o from asm
export LDEMULATION=elf_x86_64

#Man en couleur
export MANPAGER=most

function display_colors() {
    for code ({000..255}) {
	    print -nP -- "$code: %F{$code}%K{$code}Test%k%f "
	    (( code % 8 && code < 255 )) || printf '\n'
	}
}

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

alias nne="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias zshrc="emacsclient -nw ~/.zshrc"

#Secure
setxkbmap fr
setxkbmap -option caps:swapescape
xset r rate 200 30

# redefine prompt_context for hiding user@hostname
#prompt_context () { }

source ~/.zsh_aliases
