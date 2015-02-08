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
PS1="\[\033[01;32m\]\u@\[\033[01;36m\] \w \$\[\033[00m\] "
