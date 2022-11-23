# Aliases

function has_command()
{
  (( $+commands[$1] ))
}

# Use aliases when sudo
alias sudo="sudo "

alias open="xdg-open"

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

alias cat="bat -p"

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

function display_colors() {
  for code ({000..255}) {
    print -nP -- "$code: %F{$code}%K{$code}Test%k%f "
    (( code % 8 && code < 255 )) || printf '\n'
  }
}

function copy() {
  xclip -sel clip
}

# Useful
alias untar="tar xvf"
alias grep="grep --color=auto"
alias p="ping 8.8.8.8"
alias ccp="cp -r"
alias rrm="rm -rf"

# Give access rights to files
function cx() {
  chmod +x $@
}
