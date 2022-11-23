# Original theme credit goes to Gurgeh.
# This is a very stripped down version.
# With additions from Steve Losh

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '%(!.!.$)'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


PROMPT='%{$fg[cyan]%}%*%{$reset_color%} %{$fg_bold[green]%}%n%{$reset_color%}%{$fg[green]%}@%m%{$fg[cyan]%}$(collapse_pwd)%{$fg_bold[blue]%}$(git_prompt_info)%{$fg[blue]%}%{$fg[red]%}
$(prompt_char)%{$reset_color%}'

RPROMPT='%{$fg[white]%}$(virtualenv_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
