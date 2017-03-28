# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/home/nykku/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
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

#norman

alias n='python ~/python/HelpMeNorman.py -nocheat -verbose -return -printline -score *'

#Graphical C Programing Environement
export LIBRARY_PATH=$LIBRARY_PATH:/home/nykku/.graph_programming/lib
export LD_LIBRARY_PATH=$LIBRARY_PATH:/home/nykku/.graph_programming/lib
export CPATH=$CPATH:/home/nykku/.graph_programming/include


xrandr -o normal
setxkbmap fr
xset r rate 200 30

# redefine prompt_context for hiding user@hostname
prompt_context () { }

source ~/.saumon_aliases
