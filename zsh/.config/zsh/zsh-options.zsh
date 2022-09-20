# Remember where config is, in case we run compinstall again
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Mark compinit as an internal function, not an external program
autoload -Uz compinit

# Launch zsh's completion system
compinit

# allow comments on the command line
setopt INTERACTIVE_COMMENTS

# Keep oodles of command history (see https://fburl.com/zshhistory).
HISTFILE="$ZDOTDIR/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

# zsh sessions will append their history list to the history file, not replace it
setopt APPEND_HISTORY

# zsh sessions will share their history
setopt SHARE_HISTORY

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

# don't try to glob patterns
unsetopt nomatch

# Configure environment variables used by brew
eval "$($HOME/homebrew/bin/brew shellenv)"

# fzf auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# fzf key bindings
# ------------
source "$HOME/homebrew/opt/fzf/shell/key-bindings.zsh"

# enable ripgrep in fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files"
  export FZF_DEFAULT_OPTS="-m --height 50% --border"
fi
