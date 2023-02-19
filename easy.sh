#!/bin/sh
# simplify shell scripting syntax

#usage: notnull <nullable> <command>
function notnull() {
  if [ ! -z "$1" ];
  then $(echo ${@:2})
  fi
}

#usage: isnull <nullable> <command>
function isnull() {
  if [ -z "$1" ];
  then $(echo ${@:2})
  fi
}

#usage: verify <nullable> <usage help>
function verify() {
  if [ -z "$1" ]; then
    err "usage: ${@:2}"
    return 1
  fi
}

function loop() {
  # verify params
  if [ -z "$1" ] || [ -z "$2" ]; then
    err "usage: loop <script.sh> <watch-files>"; return
  fi
  fswatch -o "$2" | xargs -n1 -I{} zsh -c ". \"$HOME/.zshrc\"; . $1" -- ${@:3}
}
