# Aliases

function has_command()
{
  (( $+commands[$1] ))
}

# Use aliases when sudo
alias sudo="sudo "

# Vim
alias e=$EDITOR
if has_command nvim; then
  alias v="nvim"
  alias vi="nvim"
  alias vim="nvim"
else
  alias v="vim"
fi

alias rld="exec $SHELL"

# exa
if has_command exa; then
  alias ls="exa"
  alias t="exa --tree"
  alias lt="exa --tree --long"
  alias lg="exa -lha --git"
else
  alias ls='ls --color=always -h'
fi

alias l="ls -l"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -la"

# correction
alias ms="ls"
alias sls="ls"
alias lls="ls"
alias lq="ls"
alias sl="ls"
alias gren="grep"
alias gerp="grep"

# When pasting commands from internet
function \$() { $@ }

# better man pages
function man() {
  env \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    GROFF_NO_SGR=1 \
    _NROFF_U=1 \
    man "$@"
}

#Cmake
function cm() {
  (
  mkdir -p build && \
    cd build && \
    cmake .. && \
    make -j4
  )
}

#Cmake with clang as default compiler
function cmclang() {
  (
  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++
  mkdir -p build && \
    cd build && \
    cmake .. && \
    make -j4
  )
}

function display_colors() {
  for code ({000..255}) {
    print -nP -- "$code: %F{$code}%K{$code}Test%k%f "
    (( code % 8 && code < 255 )) || printf '\n'
  }
}

function calc() {
  echo "$@" | bc
}

# Delete temporary files
function mr() {
  find -name "*~" -delete -o -name "#*#" -delete -o -name "a.out" -delete -o -name ".#*" -delete
  clear
}

function copy() {
  xclip -sel clip
}

# Track leaks
alias valeak="valgrind --leak-check=full --show-leak-kinds=all"


# Useful
alias untar="tar xvf"
alias grep="grep --color=auto"
alias p="ping 8.8.8.8"
alias ccp="cp -r"
alias rrm="rm -rf"

# Verbose
alias cp="cp -v"
alias rm="rm -v"

# cd and ls
function c() {
  cd $1 && ls
}

# Give access rights to files
function cx() {
  chmod +x $@
}

# Make
alias m="make"
alias mj="make -j4"
alias mf="make fclean"
alias mc="make clean"
alias re="make re"

