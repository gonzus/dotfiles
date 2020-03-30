# vi:filetype=sh

DOTFILES=$HOME/src/gonzo/dotfiles

# if it exists, load our custom config
if [ -f $DOTFILES/bash/config.sh ]; then
    source $DOTFILES/bash/config.sh
fi

# if it exists, load our booking config
if [ -f $DOTFILES/bash/booking/bash/config.sh ]; then
    source $DOTFILES/bash/booking/bash/config.sh
fi
