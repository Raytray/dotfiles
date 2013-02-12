# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gurgeh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python pip github rails ruby heroku django rake)
source $ZSH/oh-my-zsh.sh

setopt no_share_history


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

#ssh into personal server.
alias raypi='ssh -p 8081 raytray@ray.7ang.me'
alias piirssi='ssh -p 8081 raytray@ray.7ang.me -t screen -dr rayirssi'

alias ntpdatethis='sudo ntpdate 0.north-america.pool.ntp.org'

#Grep running processes
alias psg='ps ax|grep '

#Grep through history
alias zhg="history | sed 's/^ *[0-9]* *//' | cat $HISTFILE - | grep "

alias cd=cdls
alias alert=alert()

#Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development/Parsely/
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

#vagrant
export PATH=$PATH:/opt/vagrant/bin

#wrk
export PATH=$PATH:/opt/wrk/bin

#emacs as default editor
export EDITOR='emacs -nw'
alias emacs='emacs -nw'
source /home/raytray/Dropbox/Configs/.zprofile

#Cool fun
alert() {
#Call alert 1h1m1s to set a 1 hour 1 min 1 second timer.
google-chrome alrt.io/"$*"
}

say() { 
#call say string to have it repeat the string back to you using google translate.
if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }
