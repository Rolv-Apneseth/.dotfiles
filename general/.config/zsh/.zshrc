source "$ZDOTDIR/zsh_functions"
source "$ZDOTDIR/zsh_fzf_functions"

# ZINIT
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
add_file "${ZINIT_HOME}/zinit.zsh"

# MISC
# Automatically add directory to stack when using `cd`. Use the commands
# `pushd`, `popd` and `dirs -v` to use the stack.
setopt auto_pushd

# If argument is unknown but is name of a directory, cd into it
setopt autocd

# Try to correct spelling of mistyped commands
setopt correct

# Enable colours
autoload -U colors && colors

# Completion styling
eval "$(dircolors "$XDG_CONFIG_HOME"/.dircolors)"

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
compinit
_comp_options+=(globdots)
zinit cdreplay -q

# Disable Ctrl+S to freeze terminal
stty stop undef
# Disable paste highlight
zle_highlight=('paste:none')

# Better time keyword output
export TIMEFMT=$'%J\n\n%*Es total\n%U user cpu\n%S system cpu\n%P cpu\n%MKB max mem'

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.cache/.zsh_history"
HISTDUP=erase
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# KEYBINDINGS
bindkey -s '^o' 'dua i^M'

# Edit current command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^F" edit-command-line
bindkey '^x^e' edit-command-line # Also add in standard Ctrl+x Ctrl+e

# INTEGRATIONS
# fzf
eval "$(fzf --zsh)"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
# zoxide
eval "$(zoxide init zsh --cmd j)"
export _ZO_ECHO=1
# starship
eval "$(starship init zsh)"

# PLUGINS
zinit light "Aloxaf/fzf-tab"
zinit light "jeffreytse/zsh-vi-mode"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zdharma-continuum/fast-syntax-highlighting"
zinit load "atuinsh/atuin"

# SNIPPETS
zinit snippet OMZP::git

# ALIASES
add_file "$HOME/.config/.aliases"

# WORK
if [ -f ~/work/.zshrc ]; then
    source ~/work/.zshrc
fi

# HOOKS
zsh_add_file "zsh_hooks"

# RICE
macchina
