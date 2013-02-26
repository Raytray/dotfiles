#Original theme credit goes to Gurgeh.
#This is a very stripped down version.

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '%(!.!.$)'
}


PROMPT='%{$fg[green]%}%*%{$reset_color%} %{$fg_bold[green]%}%n@%m%{$fg[cyan]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$fg_bold[red]%}$(prompt_char)% %{$reset_color%}'

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
