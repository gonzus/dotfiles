# colorful prompt with time, date, user, host and cwd
export PS1="\[\e[32m\]\A\[\e[m\] \[\e[36m\]\$(date +'%a %d/%b')\[\e[m\] \[\e[33m\]\u@\h\[\e[m\] \[\e[31m\]\w\[\e[m\]\n\[\e[1;31m\]\$\[\e[m\] "

# make sure ls uses colors
export CLICOLOR=1

# make sure anything using $EDITOR finds vim
export EDITOR=vim

# if it exists, use script to turn proxy on
if [ -f $HOME/bin/proxy ]; then
    source $HOME/bin/proxy 1
fi

# if it exists, load perlbrew settings
if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
    source ~/perl5/perlbrew/etc/bashrc
fi

# setup our PATH
export PATH=\
$HOME/bin:\
/usr/local/opt/gnu-tar/libexec/gnubin:\
/usr/local/opt/flex/bin:\
/usr/local/opt/bison/bin:\
/usr/local/opt/llvm/bin:\
$PATH

# setup our MANPATH
export MANPATH=\
/usr/local/opt/gnu-tar/libexec/gnuman:\
$MANPATH

# setup some aliases
alias ls='ls -Fh'
alias vi='vim'

# store any passphrases in the key-chain
ssh-add -K
