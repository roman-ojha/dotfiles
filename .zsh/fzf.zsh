# Fuzzy finder config
if [[ ! "$PATH" == */home/razzroman/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/razzroman/.fzf/bin"
fi
eval "$(fzf --zsh)"
# export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview "batcat --color=always --style=numbers --line-range :500 {}"'
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview "batcat --color=always --style=header,grid --line-range :500 {}"'
