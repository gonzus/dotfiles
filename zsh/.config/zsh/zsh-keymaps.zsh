# use emacs keys for editting
bindkey -e

# fix ctrl-left and ctrl-right to skip over words
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# make arrows search based on what's already typed
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
