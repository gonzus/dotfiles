# make sure anything using $EDITOR finds vim; for example, key "v" inside "less"
# export EDITOR=/usr/bin/vim
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

# Setup our own bin directory first in the PATH
# TODO: get rid of this, use .local only
if [[ ! "$PATH" == "*$HOME/bin*" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
if [[ ! "$PATH" == "*$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == "*$HOME/homebrew/opt/fzf/bin*" ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/homebrew/opt/fzf/bin"
fi

# Setup perl
# ---------
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
if [[ ! "$PATH" == "*$PERL_LOCAL_LIB_ROOT/bin*" ]]; then
  export PATH="${PATH:+${PATH}:}$PERL_LOCAL_LIB_ROOT/bin"
fi

export PATH="/Users/gonzo/homebrew/opt/sqlite/bin:$PATH"
