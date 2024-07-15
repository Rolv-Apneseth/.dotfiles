#!/bin/env sh

# PATH ADDITIONS
export PATH="${PATH:+${PATH}}\
:$HOME/.local/bin\
:$HOME/.local/share/cargo/bin\
:$HOME/.config/rofi/scripts"

# PROGRAMS
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=/usr/bin/nvim
export BROWSER=firefox
export TERMINAL=wezterm
export TERMINAL_EXECUTE="$TERMINAL -e"
export TERMINAL_DIR="$TERMINAL start --cwd"

# CUSTOM DIRS
# Stowed dotfiles directory
export DOTFILES="$HOME/.dotfiles"
# ZSH config file
export ZDOTDIR="$HOME/.config/zsh"
# zk notebooks
export ZK_NOTEBOOK_DIR="$HOME/Documents/zk"

# $HOME CLEANUP
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GNUPGHOME="$XDG_DATA_HOME/gupg"
export XCURSOR_PATH="/usr/share/icons:${XDG_DATA_HOME}/icons"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/.gtkrc-2.0"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GOPATH="$XDG_DATA_HOME"/go

# FZF
export FD_IGNORE_FILE="$HOME/.config/.fdignore"
export FZF_DEFAULT_COMMAND="fd --absolute-path --hidden --type file --ignore-file $FD_IGNORE_FILE"
export FZF_DEFAULT_OPTS="--no-height --preview='bat --color=always --style=plain --line-range :50 {}'"
export FZF_CTRL_T_COMMAND="fd --absolute-path --hidden --type directory --ignore-file $FD_IGNORE_FILE"
export FZF_CTRL_T_OPTS="--preview='erd --hidden --no-git --layout=inverted --level 2 --color=force {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"
