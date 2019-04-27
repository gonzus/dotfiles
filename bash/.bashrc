# vi:filetype=sh

# colorful prompt with time, date, user, host and cwd
export PS1="\[\e[32m\]\A\[\e[m\] \[\e[36m\]\$(date +'%a %d/%b')\[\e[m\] \[\e[33m\]\u@\h\[\e[m\] \[\e[31m\]\w\[\e[m\]\n\[\e[1;31m\]\$\[\e[m\] "

# make sure anything using $EDITOR finds vim
# something like less (with key v):
export EDITOR=/usr/bin/vim

# Create $HOME/bin if necessary
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi

# set up proxy
# export PROXY_HOST=webproxy
export PROXY_HOST=webproxy.corp.booking.com
export PROXY_PORT=3128
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,.booking.com"

export http_proxy="http://$PROXY_HOST:$PROXY_PORT/"
export https_proxy="http://$PROXY_HOST:$PROXY_PORT/"
export HTTP_PROXY_ALL="http://$PROXY_HOST:$PROXY_PORT/"

# if it exists, load perlbrew settings
if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# if it exists, load alias settings
if [ -f $HOME/.alias ]; then
    source $HOME/.alias
fi

# if it exists, load path settings
if [ -f $HOME/.path ]; then
    source $HOME/.path
fi
