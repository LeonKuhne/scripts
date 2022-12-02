#!/bin/sh
# simplify shell scripting syntax

#usage: notnull <nullable> <command>
function notnull() {
  if [ ! -z $1 ];
  then $(echo ${@:2})
  fi
}
