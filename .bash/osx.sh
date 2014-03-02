#
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What You Want To Public
# License, Version 3, as published by Devin Weaver. See
# http://tritarget.org/wywtpl/COPYING for more details.
#
# OVERVIEW: Max OS X specific configuration.

if [[ ! "$OSTYPE" =~ ^darwin ]]; then
	return
fi

function ls() {
  command ls -G "$@"
}

alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias documents='cd ~/Documents'

## init
##
[[ -L ~/bin/subl ]] || suggest 'ln -s' \
  '"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"' \
  '~/bin/subl'

load_or_suggest "$(brew --prefix)/etc/bash_completion" \
'brew install bash_completion'

# prompt
PS1="\[\033[01;36m\]\u@\[\033[01;34m\] \w \$\[\033[00m\] "
