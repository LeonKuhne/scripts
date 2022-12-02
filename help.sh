

function help() {
  if [ -z "$@" ]; then
    echo "usage: help <script>"
    return
  fi
  
  cat "$@" |
    grep "^function" |
    sed s/function\ //g |
    sed s/\(\)\ \{//g |
    xargs python3 -c '
import sys,subprocess;
for x in sys.argv[1:]:
  subprocess.Popen(["echo ${C_WARN}"+x+"$C_RESET"], shell=True)'
}
