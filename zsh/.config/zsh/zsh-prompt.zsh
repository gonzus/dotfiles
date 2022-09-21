# Colors
autoload -Uz colors && colors

## VCS support -- enable only git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

# setup a hook that runs before every prompt.
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
      # This will show the marker if there are any untracked files in repo.
      # If instead you want to show the marker only if there are untracked
      # files in $PWD, use:
      #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
    hook_com[staged]+='!' # signify new files with a bang
  fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}[%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%}]"

PROMPT=$'%F{green}%T%f %F{cyan}%D{%a %d/%b}%f %F{yellow}%n@%m%f %F{red}%~%f \$vcs_info_msg_0_\n%(0?::%F{red}[%?]%f )%F{magenta}%(!:#:$)%f '

# gonzo's original prompt:
# export PROMPT=$'%F{green}%T%f %F{cyan}%D{%a %d/%b}%f %F{yellow}%n@%m%f %F{red}%~%f\n%(0?::%F{red}[%?]%f )%F{magenta}%(!:#:$)%f '