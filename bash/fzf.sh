# vi:filetype=sh

export FZF_DEFAULT_COMMAND='fd --type f'

# THIS WORKS IN MAC, NOT IN LINUX
# export FZF_DEFAULT_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/gdiethelm/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/gdiethelm/src/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/gdiethelm/src/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/gdiethelm/src/fzf/shell/key-bindings.bash"
