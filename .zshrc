# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -l" 
alias v="mvim "
alias mci="mvn clean install "
alias mcd="mvn clean deploy "
alias hosts="sudo mvim /etc/hosts"
alias bash="v ~/.bash_profile"
alias zshrc="v ~/.zshrc"
alias http="python -m SimpleHTTPServer"

alias push-g="git checkout gh-pages && git merge master && git push origin gh-pages && git checkout master"
alias push-m="git push origin master"

alias pull-g="git pull origin gh-pages"
alias pull-m="git pull origin master"

alias mw="make watch"
alias mb="make build-doc"
alias md="make debug"
alias ms="make server"

export NODE_PATH="/usr/local/lib/node_modules/"
