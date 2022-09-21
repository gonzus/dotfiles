# Remember where config is, in case we run compinstall again
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' menu select

# Mark compinit as an internal function, not an external program
autoload -Uz compinit && compinit

# show completion lists
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# allow comments on the command line
setopt INTERACTIVE_COMMENTS

# zsh sessions will append their history list to the history file, not replace it
setopt APPEND_HISTORY

# zsh sessions will share their history
setopt SHARE_HISTORY

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

# don't try to glob patterns
unsetopt nomatch

# no beeps please
unsetopt BEEP

# Keep oodles of command history
HISTFILE="$ZDOTDIR/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
