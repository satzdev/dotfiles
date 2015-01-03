#
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What You Want To Public
# License, Version 3, as published by Devin Weaver. See
# http://tritarget.org/wywtpl/COPYING for more details.
#
# OVERVIEW: Shared configuration.

## utils
##
suggest() {
  local bold=$(tput bold)
  local normal=$(tput sgr0)
  echo "${bold}Suggestion:${normal} $@"
}

load_or_suggest() {
  if [[ -r "$1" ]]; then . "$1"
  else shift; while (("$#")); do suggest "$1"; shift; done
  fi
}

# for learning. similar to 'set -x'
_echo_exec() {
  "$@"
  echo "\$ $@"
}

## aliases and functions
##
alias ..='cd ..'
alias ...='cd ../..'

# list all files sorted by time.
alias la='_echo_exec ls -AFhlrt'
alias ld='ls -AFhlrt | grep "^d"'

# taskwarrior
t() {
  _echo_exec task "$@"
}
ta() {
  _echo_exec task add "$@"
}
tm() {
  _echo_exec task "$1" mod "${@:2}"
}
tc() {
  _echo_exec task config "$@"
}
tcp() {
  _echo_exec task config default.project "$@"
}
td() {
  _echo_exec task $1 done
}
ts() {
  _echo_exec task $1 start
}
tsd() {
  _echo_exec task show default."$@"
}
tcd() {
  _echo_exec task config default."$@"
}

mcd() {
  _echo_exec mkdir -p "$1" && _echo_exec cd "$1"
}

# find shorthand
alias fnd='_echo_exec find . -name'

# copy with progress
alias cpwp='_echo_exec rsync -aPvW --human-readable --progress'

## git stuff
##
alias gitlog='_echo_exec git log --all --decorate --graph --oneline'

gitcommit() {
  _echo_exec git commit -am "$1"
}

# undo push
alias gitundo='_echo_exec git push -f origin HEAD^:master'

## history
##
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

## init
##
load_or_suggest "${HOME}/code/z/z.sh" \
  'mcd ~/code' \
  'git clone https://github.com/rupa/z' \
  'chmod +x z/z.sh'

load_or_suggest '/usr/local/share/chruby/chruby.sh' \
  'install https://github.com/postmodern/chruby'
load_or_suggest '/usr/local/share/chruby/auto.sh'

## load sub config files
##
for file in "${HOME}/.bash"/*.sh; do
  load_or_suggest "${file}"
done
unset file

## variables
##
[[ -d "${HOME}/bin" ]] || suggest 'mkdir ~/bin'
PATH="${HOME}/bin:${PATH}"
export PATH

## unset
##
unset -f suggest
unset -f load_or_suggest

