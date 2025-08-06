#!/bin/bash

# default config
if [ -z $LWD_DIR ]; then 
  LWD_DIR=$HOME/.lwd
  touch $LWD_DIR
fi
if [ -z $C_DIR ]; then C_DIR=.cd; fi

# change [directory]
function c() {
  if [ -z "$@" ]; then
    ls --color .
  else 
    cd $@
    pwd
    pwd > $LWD_DIR # store last working directory
    rand_prompt # indicate change with color
    c_run
  fi
}

function c_run() {
  # execute directory script if exists
  if [ -f "$(pwd)/$C_DIR" ]; then 
    source "./$C_DIR"
  fi
}

# start at last working directory
function back() {
  c $(cat $LWD_DIR)
}
