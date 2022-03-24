# MISC
# enable colours
autoload -U colors && colors
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# If argument is unknown but is name of a directory, cd into it
setopt autocd 
# Disable Ctrl+S to freeze terminal
stty stop undef
# Disable paste hightlight
zle_highlight=('paste:none')


# KEYBINDINGS
bindkey -s '^s' 'ncdu^M'
bindkey -s '^n' 'nvim^M'


# VIM KEYBINDINGS
bindkey -v
export KEYTIMEOUT=1
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"


# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/.zsh_history"
setopt SHARE_HISTORY
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# 


# ZSH FUNCTIONS
source "$ZDOTDIR/zsh_functions"


# PLUGINS 
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"


# ALIASES
# Note: some sketchy aliases are used in my .aliases file so check
# there first when there's a problem
ALIASES_PATH="$HOME/.config/.aliases"
# shellcheck source=/home/rolv/.aliases
[[ -f $ALIASES_PATH ]] && . "$ALIASES_PATH"


# RICE
eval "$(starship init zsh)"
neofetch

# KITTY SHELL INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

