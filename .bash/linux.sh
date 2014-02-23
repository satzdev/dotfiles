#
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What You Want To Public
# License, Version 3, as published by Devin Weaver. See
# http://tritarget.org/wywtpl/COPYING for more details.
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
