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
plugins=(pip git-extras mvn zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

setopt no_share_history
unsetopt correct_all
unsetopt correct
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PATH=$PATH:$HOME/.rvm/bin:$HOME/.local/bin # Add RVM to PATH for scripting, add python to path
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
source /home/raytray/Dropbox/Configs/.zprofile

alias ls='ls --color=auto -CF'

#Grep running processes
alias psg='ps -ef | grep'

#Grep through history
alias zhg="history | cut -c 8- | grep"

#Copy file or string to clipboard.
clipboard(){
    if [ -e $1 ]
    then
        cat $1 | xclip -selection clipboard
    else
        echo $* | xclip -selection clipboard
    fi
}

#emacs as default editor
alias emacs='emacs -nw'
export EDITOR='emacs -nw'

alias cd=cdls

#Verbosity!
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias ln='ln -v'