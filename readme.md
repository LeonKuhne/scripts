# Welcome

## To install, simply run:
```
rcfile=$(ls ~/.*shrc | sed 's/.*\///g')
mkdir -p ~/.config
git clone git@github.com:leonkuhne/scripts.git ~/.config/scripts
echo "\n# github.com:leonkuhne/scripts\nfor f in ~/.config/scripts/*.sh; do source \$f; done" >> ~/$rcfile
source ~/$rcfile
```

## Optional: To use the `cd` instead of `c`, additionally run:
```
rcfile=$(ls ~/.*shrc | sed 's/.*\///g')
echo "alias cd=c" >> ~/$rcfile
source ~/$rcfile
```

## Noteworthy Commands
#### `c [directory]`
Same as `cd`, but also executes `.cd` file in current directory if it exists. 
#### `COLORS`
A list of available colors for the terminal
#### `BULLETS`
A list of available ascii bullets for the terminal
