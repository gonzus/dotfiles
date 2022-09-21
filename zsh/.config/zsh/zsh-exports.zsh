# make sure anything using $EDITOR finds vim; for example, key "v" inside "less"
export EDITOR=/Users/gonzo/.local/bin/lvim
export VISUAL=$EDITOR

# If possible, use colors everywhere
export CLICOLOR=1

# colorful prompt with time, date, user, host and cwd
export PROMPT=$'%F{green}%T%f %F{cyan}%D{%a %d/%b}%f %F{yellow}%n@%m%f %F{red}%~%f\n%(0?::%F{red}[%?]%f )%F{magenta}%(!:#:$)%f '

# Define format of information printed with "time CMD..."
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\nmemory\t%M KB'

# better colors for jq output
export JQ_COLORS="1;33:1;36:1;31:0;39:0;32:1;39:1;39"

# Configure environment variables used by brew
eval "$($HOME/homebrew/bin/brew shellenv)"

# Set up some additional paths:
zsh_add_path "$HOME/bin" # TODO get rid of this one
zsh_add_path "$HOME/.local/bin"
zsh_add_path "$HOME/homebrew/opt/sqlite/bin"
zsh_add_path "$HOME/homebrew/opt/fzf/bin"

# Setup perl
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
zsh_add_path "$PERL_LOCAL_LIB_ROOT/bin"

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
