# Configure environment variables used by brew
eval "$($HOME/homebrew/bin/brew shellenv)"

# fzf auto-completion
[[ $- == *i* ]] && source "$HOME/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# fzf key bindings
source "$HOME/homebrew/opt/fzf/shell/key-bindings.zsh"
