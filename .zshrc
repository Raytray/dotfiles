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
plugins=(pip git-extras mvn gradle zsh-syntax-highlighting virtualenv virtualenvwrapper)

zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

setopt no_share_history
unsetopt correct_all
unsetopt correct

#Credit to Nishant 'BinRoot' Shukla.
cdls() {
    if [ -z "$1" ]; then
        cd && ls --color=auto -CF
    else
        cd "$*" && ls --color=auto -CF
    fi
}

alias ls='ls --color=auto -CF'

#Grep running processes
alias psg='ps -ef | grep'

#Grep through history
alias zhg="history | cut -c 8- | grep"

#emacs as default editor
alias emacs='emacs -nw'
export EDITOR='emacs -nw'

alias cd=cdls

#Verbosity!
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias ln='ln -v'


alias python=python3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export VIRTUALENVWRAPPER_PYTHON=python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repositories
source /usr/local/bin/virtualenvwrapper.sh
