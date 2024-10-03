# Welcome

## To install, simply run:
```bash
rcfile=$HOME/$(ls ~/.*shrc | sed 's/.*\///g')
mkdir -p ~/.config
git clone git@github.com:LeonKuhne/scripts.git ~/.config/scripts
echo -e "\n# github.com:leonkuhne/scripts\nfor f in ~/.config/scripts/*.sh; do source \$f; done" >> $rcfile
source $rcfile
```

## Optional: To use `cd` instead of `c`, additionally run:
```bash
echo "alias cd=c" >> ~/$rcfile
source ~/$rcfile
```

## Noteworthy Commands
#### `c [directory]`
Same as `cd`, but also executes `.cd` file in current directory if it exists. 
#### `COLORS`
A set of terminal colors prefixed with 'C_' eg '$C_INFO'
#### `BULLETS`
A set of terminal bullets prefixed with 'B_' eg '$B_ARROW'
