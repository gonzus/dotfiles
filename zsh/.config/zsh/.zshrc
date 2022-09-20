# Remember where config is, in case we run compinstall again
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"

# Mark compinit as an internal function, not an external program
autoload -Uz compinit

# Launch zsh's completion system
compinit

# allow comments on the command line
setopt INTERACTIVE_COMMENTS

# Keep oodles of command history (see https://fburl.com/zshhistory).
HISTFILE="$HOME/src/zsh/zsh_history"
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

# If possible, use colors everywhere
export CLICOLOR=1

# colorful prompt with time, date, user, host and cwd
export PROMPT=$'%F{green}%T%f %F{cyan}%D{%a %d/%b}%f %F{yellow}%n@%m%f %F{red}%~%f\n%(0?::%F{red}[%?]%f )%F{magenta}%(!:#:$)%f '

# Define format of information printed with "time CMD..."
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E\nmemory\t%M KB'

# better colors for jq output
export JQ_COLORS="1;33:1;36:1;31:0;39:0;32:1;39:1;39"

# use emacs keys for editting
bindkey -e

# fix ctrl-left and ctrl-right to skip over words
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# Setup our own bin directory first in the PATH
if [[ ! "$PATH" == "*$HOME/bin*" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
if [[ ! "$PATH" == "*$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# make sure anything using $EDITOR finds vim; for example, key "v" inside "less"
# export EDITOR=/usr/bin/vim
export EDITOR=/Users/gonzo/.local/bin/lvim
export VISUAL=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias lvim=$EDITOR

# Configure environment variables used by brew
eval "$($HOME/homebrew/bin/brew shellenv)"

# quick aliases
alias ls="ls --color=auto -Fh"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# make TERM work correctly over ssh connections
alias sshk="kitty +kitten ssh"

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

# get some bovine wisdom
fortune | cowsay -f tux | lolcat

# enable better TAB completion
# source $HOME/src/zsh/fzf-tab/fzf-tab.plugin.zsh

# enable prompt autosuggestions
source $HOME/src/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh syntax highlighting (and later fix color for comments)
# MUST BE LAST LINE IN THIS FILE
source $HOME/src/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[comment]=fg=245
