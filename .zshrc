# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ray"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(pip zsh-syntax-highlighting git-extras virtualenvwrapper autoenv)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

setopt no_share_history
unsetopt correct_all
unsetopt correct

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Credit to Nishant 'BinRoot' Shukla.
cdls() {
    if [ -z "$1" ]; then
        cd && ls --color=auto -CF
    else
        cd "$*" && ls --color=auto -CF
    fi
}

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source /home/raytray/Dropbox/Configs/.zprofile

alias ls='ls --color=auto -CF'

#brief alias to ntpdate ondemand.
alias ntpdatethis='sudo ntpdate 0.north-america.pool.ntp.org'

#alias for defaulting on metric reports for the weather-util program.
alias weather='weather --metric --alert'

#alias for youtube-dl to use title as filenames by default.
alias youtube-dl='youtube-dl -t'

#Grep running processes
alias psg='ps -ef | grep'

#Grep through history
alias zhg="history | cut -c 8- | grep"
#Open email compose window with attachment
alias write-email=write-email-fn
write-email-fn() {
    if [ -z "$1" ]; then
        thunderbird -compose
    else
        local thePWD=`pwd`
        for var in $@; do
            attachment=$attachment','$thePWD'/'$var
        done
        local attachment=`echo $attachment | cut -c 2-`
        thunderbird -compose "attachment='$attachment'"
    fi
}
#credit to alrra
calc() {

    local result=""

    result="$( printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n' )"
    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        printf "$result" | sed -e 's/^\./0./' -e 's/^-\./-0./' -e 's/0*$//;s/\.$//'
    else
        printf "$result"
    fi

    printf "\n"
}

#Fahrenheit to Celsius
f2c(){
    calc "($1 - 32.0) * 5.0 / 9.0"
}

#Celsius to Fahrenheit
c2f(){
    calc "$1 * 9.0 / 5.0 + 32.0"
}

alias calc="noglob calc"

#Copy file or string to clipboard.
clipboard(){
    if [ -e $1 ]
    then
        cat $1 | xclip -selection clipboard
    else
        echo $* | xclip -selection clipboard
    fi
}

#Google given string
google(){
    searchTerm=`echo $* | sed -e 's/ /\+/g'`
    searchTerm='https://www.google.com/search?q='$searchTerm
    google-chrome $searchTerm
    unset 'searchTerm'
}

alias fliptable="echo -ne '    ┬─┬﻿ ノ( °-°ノ)   \r'
sleep 1
echo -ne '           (╯°□°）╯︵ ┻━┻           \r'
sleep 1
echo -ne '           (ノ°Д°)ノ  ︵  ┬─┬       \r'
sleep 1
echo -ne '           (ノ°□°)ノ   ︵   ︵  ┻━┻ \r'
sleep 1
echo -ne '     ┻━ ︵╰(°Д°)╯︵ ━┻              \r'
echo -ne '\n'"

#Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

#vagrant
export PATH=$PATH:/opt/vagrant/bin

#emacs as default editor
alias emacs='emacs -nw'
export EDITOR='emacs -nw'

#Call alert 1h1m1s to set a 1 hour 1 min 1 second timer.
alert() {
    google-chrome alrt.io/"$*"
}

#call say string to have it repeat the string back to you using google translate.
say() {
    if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

alias cd=cdls
