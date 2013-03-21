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
plugins=(pip zsh-syntax-highlighting git-extras)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

setopt no_share_history
unsetopt correct_all

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

alias ls='ls --color=auto -CF'

#alias for defaulting on metric reports for the weather-util program.
alias weather='weather --metric --alert'

#alias for youtube-dl to use title as filenames by default.
alias youtube-dl='youtube-dl -t'

#ssh into personal server.
alias raypi='ssh -p 8081 raytray@ray.7ang.me'
alias piirssi='ssh -p 8081 raytray@ray.7ang.me -t screen -dr rayirssi'

#Grep running processes
alias psg='ps ax|grep '

#Grep through history
alias zhg="history | sed 's/^ *[0-9]* *//' | cat $HISTFILE - | grep "

#Open email compose window with attachment
alias write-email=write-email-fn
write-email-fn() {
    #Finish this, allow it to attach up to any number of arguments. Get the count and just do `pwd`/$#
    if [ -z "$1" ]; then
	`thunderbird -compose`
    else
	thePWD=`pwd`
	for var in $@; do
	    attachment=$attachment','$thePWD'/'$var
	done
	unset "thePWD"
	attachment=`echo $attachment | cut -c 2-`
	`thunderbird -compose "attachment='$attachment'"`
	unset "attachment"
    fi
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
source /home/raytray/Dropbox/Configs/.zprofile

#Cool fun
alert() {
#Call alert 1h1m1s to set a 1 hour 1 min 1 second timer.
    google-chrome alrt.io/"$*"
}

say() {
#call say string to have it repeat the string back to you using google translate.
    if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

alias cd=cdls
