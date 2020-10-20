# vi:filetype=sh

# needs to be done early
export TERM=xterm-256color

# fiddle with the hostname we show for the prompt
# IT does not want me to change my real hostname
PROMPT_HOST=${HOSTNAME:-$(hostname)}
if [ "$PROMPT_HOST" = "LL8G2L4H2" ]
then
    PROMPT_HOST="laptop-gonzo"
fi
export PROMPT_HOST

# colorful prompt with time, date, user, host and cwd
export PS1="\[\e[32m\]\A\[\e[m\] \[\e[36m\]\$(date +'%a %d/%b')\[\e[m\] \[\e[33m\]\u@${PROMPT_HOST}\[\e[m\] \[\e[31m\]\w\[\e[m\]\n\[\e[1;31m\]\$\[\e[m\] "

# make sure anything using $EDITOR finds vim
# something like less (with key v):
export EDITOR=/usr/bin/vim

DOTFILES=$HOME/src/gonzo/dotfiles

# Create $HOME/bin if necessary
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi

# if it exists, load perlbrew settings
if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# if it exists, load sdkman settings
if [ -f $DOTFILES/bash/sdkman.sh ]; then
    source $DOTFILES/bash/sdkman.sh
fi

# if it exists, load alias settings
if [ -f $DOTFILES/bash/alias.sh ]; then
    source $DOTFILES/bash/alias.sh
fi

# if it exists, load less settings
if [ -f $DOTFILES/bash/less.sh ]; then
    source $DOTFILES/bash/less.sh
fi

# if it exists, load path settings
if [ -f $DOTFILES/bash/path.sh ]; then
    source $DOTFILES/bash/path.sh
fi

# if it exists, load fzf settings
if [ -f $DOTFILES/bash/fzf.sh ]; then
    source $DOTFILES/bash/fzf.sh
fi
