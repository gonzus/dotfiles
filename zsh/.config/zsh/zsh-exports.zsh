# move completion file out of the way
export ZSH_COMPDUMP=$HOME/.cache/zsh/zcompdump-$HOST

# make sure anything using $EDITOR finds vim; for example, key "v" inside "less"
# export EDITOR=/Users/gonzo/.local/bin/lvim
# export EDITOR=/usr/bin/vi
# export EDITOR=/usr/bin/nvim
export EDITOR=/Users/gonzo/.local/bin/lvim
export VISUAL=$EDITOR

# make sure gpg knows our tty
export GPG_TTY=$(tty)

# If possible, use colors everywhere
export CLICOLOR=1

# Define format of information printed with "time CMD..."
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\nmemory\t%M KB'

# better colors for jq output
export JQ_COLORS="1;33:1;36:1;31:0;39:0;32:1;39:1;39"

# Set up some additional paths:
zsh_add_path "$HOME/.local/bin"

if [ -f "$HOME/.config/zsh/zsh-gonzo.zsh" ]; then
  source "$HOME/.config/zsh/zsh-gonzo.zsh"
fi
if [ -f "$HOME/.config/zsh/zsh-meta.zsh" ]; then
  source "$HOME/.config/zsh/zsh-meta.zsh"
fi

# Setup perl
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
zsh_add_path "$PERL_LOCAL_LIB_ROOT/bin"

# enable ripgrep in fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files"
  export FZF_DEFAULT_OPTS="-m --height 50% --border"
fi
