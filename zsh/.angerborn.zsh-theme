if [ "$USER" = "root" ]
then CARETCOLOR="red"
else CARETCOLOR="white"
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$reset_color%}%{${fg_bold[yellow]}%}%~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}\$%{${reset_color}%} '

RPS1='$(vi_mode_prompt_info) ${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}[NORMAL]%{$reset_color%}%{$fg[magenta]%}<<%{$rejustset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
