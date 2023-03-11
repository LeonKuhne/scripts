#!/bin/bash
self="$0"

# construct a color
function color() {
  c_style="$1;" # 0-8
  notnull "$2" export c_fg="$(($2+30));" # 0-7
  notnull "$3" export c_bg="$(($3+40))" # 0-7
  echo -en "\033[$c_style$c_fg${c_bg}m"
}

# custom bullet points
export B_ARROW=→
export B_TRIANGLE=►
export B_CIRCLE=•
export B_EMPTY=○
export B_BULLET=⁍
export B_SMALL=◦

# custom shell agnostic color aliases
export C_RESET=$(color 0 0)
export C_TITLE=$(color 1 0 2)
# copied from linux kernal log levels
export C_DEBUG=$(color 1 4 0)
export C_INFO=$(color 1 2 0)
export C_NOTICE=$(color 1 0 7)
export C_WARN=$(color 1 6 0)
export C_ERR=$(color 1 1 0)
export C_CRIT=$(color 1 0 6)
export C_ALERT=$(color 1 0 5)
export C_EMERG=$(color 1 7 1)

# handy helper
function c_log() { 
  echo -n "$1"
  echo ${@:2}
  echo -n "$C_RESET";
}
# same as kernal log levels
function title() { c_log "$C_TITLE" $@; }
function debug() { c_log "$C_DEBUG" $@; }
function info() { c_log "$C_INFO" $@; }
function notice() { c_log "$C_NOTICE" $@; }
function warn() { c_log "$C_WARN" $@; }
function err() { c_log "$C_ERR" $@; }
function crit() { c_log "$C_CRIT" $@; }
function alert() { c_log "$C_ALERT" $@; }
function emerg() { c_log "$C_EMERG" $@; }

# list all available color constants
function COLORS() {
  grep "^export C_" $self |
    sed "s/^export\ //g" |
    sed "s/=.*$//g" |
    xargs python3 -c '
import sys, os
reset = "\033[0m" 
text = []
for color in sys.argv[1:]:
  if color:
    code = os.environ[color]
    color = color.replace("C_", "")
    str = f"{code}{color}{reset}"
    text.append(str)
print(", ".join(text))'
}

# list all available bullet constants
function BULLETS() {
  grep "^export B_" $self |
    sed "s/^export\ //g" |
    sed "s/=.*$//g" |
    xargs python3 -c '
import sys, os
text = []
for color in sys.argv[1:]:
  if color:
    bullet = os.environ[color]
    name = color.replace("B_", "")
    str = f"{bullet} {name}"
    text.append(str)
print("\n".join(text))'
}

# print out your color palet
function colors() {
  for bg in {7..0}; do
    for fg in {0..7}; do
      for style in {0..8}; do
        c=$(color $style $fg $bg)
        echo -ne "$c($style,$fg,$bg)$C_RESET"
      done;
      echo;
    done;
  done;
}