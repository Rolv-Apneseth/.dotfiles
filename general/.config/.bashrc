# MISC
# If not running interactively, exit
[[ $- == *i* ]] || return

# Check the window size after each command and, if necessary, update the values of LINES
# and COLUMNS.
shopt -s checkwinsize
# Append to the history file, don't overwrite it
shopt -s histappend

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# History size
HISTSIZE=1000
HISTFILESIZE=2000


# ALIASES
# Note: some sketchy aliases are used in my .aliases file so check there
# first when there's a problem
ALIASES_PATH="$HOME/.config/.aliases"
# shellcheck source=/home/rolv/.aliases
[[ -f $ALIASES_PATH ]] && . "$ALIASES_PATH"


# RICE
eval "$(starship init bash)"
neofetch


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
