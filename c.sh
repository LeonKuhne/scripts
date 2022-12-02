
# change [directory]
function c() {
  if [ -z "$@" ]; then
    ls --color .
  else 
    cd $@
    pwd
    pwd > $LWD_DIR # store last working directory
    rand_prompt # indicate change with color
    if [ -f "$(pwd)/$C_DIR" ]; then # execute directory script
      source ./"$C_DIR"
    fi
  fi
}
