# THESE NEED TO GO AFTER EXPORTS

# aliases for vim
alias vi=$EDITOR
alias vim=$EDITOR
alias lvim=$EDITOR

# make TERM work correctly over ssh connections
alias sshk="kitty +kitten ssh"

OS="$(uname -s)"
case "$OS" in
  Darwin) # Mac OS X
    # use colors
    alias ls="ls --color=auto -Fh"
    alias grep="grep --color=auto"
    alias diff="diff --color=auto"
    ;;

  Linux)
    alias ls='ls --color=auto'
    ;;

  *)
    echo "Unknown OS: [$OS]"
    ;;
esac
