source "$ZDOTDIR/zsh_functions"
source "$ZDOTDIR/zsh_fzf_functions"

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

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Disable Ctrl+S to freeze terminal
stty stop undef
# Disable paste hightlight
zle_highlight=('paste:none')

# Better time keyword output
export TIMEFMT=$'%J\n\n%*Es total\n%U user cpu\n%S system cpu\n%P cpu\n%MKB max mem'

# KEYBINDINGS
bindkey -s '^s' 'dua i^M'
bindkey -s '^n' 'nvim^M'

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/.zsh_history"
setopt SHARE_HISTORY
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# FZF
add_file "/usr/share/fzf/completion.zsh"
add_file "/usr/share/fzf/key-bindings.zsh"
add_file "/usr/share/doc/fzf/examples/completion.zsh"
add_file "/usr/share/doc/fzf/examples/key-bindings.zsh"
add_file "~/.fzf.zsh"
add_file "$ZDOTDIR/completion/_fnm"

# ZOXIDE
eval "$(zoxide init zsh --cmd j)"
export _ZO_ECHO=1

# PLUGINS
zsh_add_plugin "jeffreytse/zsh-vi-mode"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"

# ALIASES
# Note: some sketchy aliases are used in my .aliases file so check
# there first when there's a problem
add_file "$HOME/.config/.aliases"

# RICE
eval "$(starship init zsh)"
macchina

# Kitty Shell Integration
if test -n "$KITTY_INSTALLATION_DIR"; then
	export KITTY_SHELL_INTEGRATION="enabled"
	autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
	kitty-integration
	unfunction kitty-integration
fi

# HOOKS
zsh_add_file "zsh_hooks"
