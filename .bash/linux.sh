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
