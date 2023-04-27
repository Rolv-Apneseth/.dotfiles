#!/bin/env sh

# PATH ADDITIONS
export PATH="${PATH:+${PATH}}\
:$HOME/.local/bin\
:$HOME/work/tools\
:$HOME/work/logins\
:$HOME/.config/rofi/scripts"

# Set default programs through environment variables
# These are used by, for example, my Qtile config and Thunar custom actions
export MY_EMAIL_CLIENT="thunderbird"
export MY_EXPLORER="thunar"
export MY_SCREENSHOT="flameshot gui"
export MY_SYSTEM_MONITOR="psensor"
export MY_VOLUME_MANAGER="pavucontrol"
export MY_WORK_COMMUNICATION="google-chat-linux"
export MY_MEDIA_PLAYER="celluloid"
export MY_FONTS_EXPLORER="font-manager"

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

# Terminal
export TERMINAL="wezterm"
export TERMINAL_EXECUTE="$TERMINAL -e"
export TERMINAL_DIR="$TERMINAL start --cwd"

# Rofi
export LAUNCHER_WRAPPER="rofi-wrapper"
export MY_LAUNCHER="$LAUNCHER_WRAPPER run"
export MY_GAMES_LAUNCHER="$LAUNCHER_WRAPPER games"
export MY_CLIPBOARD="$LAUNCHER_WRAPPER clipboard"
export MY_CALCULATOR="$LAUNCHER_WRAPPER calc"
export MY_SELECTOR_DEFAULT_SOUND_SINK="$LAUNCHER_WRAPPER sound_sink"

# Music
export MY_MUSIC_CLIENT="$TERMINAL_EXECUTE ncmpcpp"
export MY_MUSIC_TOGGLE="mpc toggle"
export MY_MUSIC_NEXT="mpc next"
export MY_MUSIC_PREV="mpc prev"

# Stowed dotfiles directory
export DOTFILES="$HOME/.dotfiles"

# ZSH config file
export ZDOTDIR="$HOME/.config/zsh"

# zk notebooks
export ZK_NOTEBOOK_DIR="$HOME/Documents/zk"

# Fot GTK 4 Theme
export GTK_THEME="Juno"
# For QT Themes
export QT_QPA_PLATFORMTHEME="qt5ct"

# $HOME cleanup
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

# START
# Notifications
dunst &
# RGB
openrgb -p Main &
# Music
mpd &
