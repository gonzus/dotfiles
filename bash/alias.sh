# vi:filetype=sh

alias vi='vim'
alias ls='ls --color=auto -Fh'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias fd='fdfind'

# maybe as scp?
#
# -a, --archive              archive mode; equals -rlptgoD (no -H,-A,-X)
# -x, --one-file-system      don't cross filesystem boundaries
#     --devices              preserve device files (super-user only)
#     --specials             preserve special files
# -D                         same as --devices --specials
# -S, --sparse               turn sequences of nulls into sparse blocks
# -X, --xattrs               preserve extended attributes
# -A, --acls                 preserve ACLs (implies -p)
# -l, --links                copy symlinks as symlinks
# -H, --hard-links           preserve hard links
# -p, --perms                preserve permissions
# --progress                 show progress during transfer
# -e, --rsh=COMMAND          specify the remote shell to use
#
# NOTE -- ADD BY HAND!
#     --delete               delete extraneous files from destination dirs
alias rcp='/usr/bin/rsync -a -x -D -S -X -A -l -H -p --progress -e="ssh"'
