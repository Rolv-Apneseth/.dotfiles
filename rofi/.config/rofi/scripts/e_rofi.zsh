#!/bin/env zsh
# ZSH required because of the word splitting used

# Locate and edit file in given directory, but use rofi as a picker and open a new editor window
${(z)FZF_DEFAULT_COMMAND} |
    rofi -dmenu -theme selector -p "Edit file" |
    xargs --no-run-if-empty "${(z)TERMINAL_EXECUTE}" "$EDITOR"
