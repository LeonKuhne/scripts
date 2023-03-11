#!/bin/zsh

#
# MY
# CUSTOM 
# FUNCTIONS 
#            

# randomize color prompt
function rand_prompt() {
  PROMPT="%F{$((1+RANDOM%255))}>%f "
}

# randomize background color
function rand_bg() {
  convert -size 100x100 xc:#990000 $BG_PATH #generate image
  #sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$BG_PATH'" && killall Dock 
}

function fill() {
  python3 -c "import shutil; print('$1'*shutil.get_terminal_size().columns)"
}

# indent a multiline command
function indent() {
  if [ ! -z "$1" ]
  then prefix="$1"
  else prefix="- "
  fi

  while read input; do
    echo "${prefix}${input}";
  done
}

function mute() {
  $@ > /dev/null 2>&1
}

# set terminal theme
theme_config=~/.config/kitty/theme.conf
function theme() {
  rm ~/.config/kitty/theme.conf
  wget "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$1.conf" -O "$theme_config"
  echo "press '⌃+⌘+,' to reload theme"
}

# git project
function get() {
  git clone git@github.com:leonkuhne/$1.git
  c $1
}

function browse() {
  if [ -z $1 ]; then
    echo "usage: browse <url>"
    return
  fi
  open -a $BROWSER -g "$1"
  open -a $BROWSER # focus the window
}

# search the internet
function goo() {
  url=$(echo "$@" | jq -sRr @uri)
  url="https://www.google.com/search?q=$url"
  browse $url
}

# navigate with ranger
function nav() {
  bash -c "ranger $@ --choosedir=$LWD_DIR"
  back
}

function notes() {
  cat .notes
}

function note() {
  echo "$(date '+%H:%M %m/%d') $@" >> .notes
  tail -n 5 .notes
}

function post() {
  curl \
    --location --request POST "$1" \
    --header 'Content-Type: application/json' \
    --data-raw "$2"
}
