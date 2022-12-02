# uncomment this and final line to profile
# zmodload zsh/zprof

source $ZDOTDIR/zsh-functions.zsh

zsh_add_file zsh-options.zsh
zsh_add_file zsh-exports.zsh
zsh_add_file zsh-prompt.zsh
zsh_add_file zsh-aliases.zsh
zsh_add_file zsh-keymaps.zsh
zsh_add_file zsh-plugins.zsh
zsh_add_file zsh-programs.zsh

# uncomment this and first line to profile
# zprof
