#
# OVERVIEW: Linux specific  configuration.

if [[ ! "$OSTYPE" = 'linux-gnu' ]]; then
  return
fi

function ls() {
  command ls --color=auto "$@"
}

alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias documents='cd ~/Documents'
alias pbcopy='xclip -select clipboard'
alias pbpaste='xclip -select clipboard -o'

# prompt
PS1="\[\033[01;32m\]\u@\[\033[01;36m\] \w \$\[\033[00m\] "
