# vi:syntax=sh

CARETCOLOR="blue"

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$reset_color%}%{${fg_bold[white]}%}%~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}\$%{${reset_color}%} '

RPS1='$(vi_mode_prompt_info) ${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[green]%}[NORMAL]%{$reset_color%}%{$fg[green]%}<<%{$rejustset_color%}"
