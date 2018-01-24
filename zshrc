export ZSH=/home/nyquase/.oh-my-zsh

ZSH_THEME="saumon"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#Much export such wow
export LC_ALL=en_US.UTF_8
export USER_NICKNAME=Nyquase
export TEKUSER=adrien.rouhete@epitech.eu

#Man en couleur
export MANPAGER=most

#Graphical C Programing Environement
export LIBRARY_PATH=$LIBRARY_PATH:/home/nyquase/.graph_programming/lib
export LD_LIBRARY_PATH=$LIBRARY_PATH:/home/nyquase/.graph_programming/lib
export CPATH=$CPATH:/home/nyquase/.graph_programming/include


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

#Secure
xrandr -o normal
setxkbmap fr
xset r rate 200 30

# redefine prompt_context for hiding user@hostname
prompt_context () { }

source ~/.zsh_aliases
