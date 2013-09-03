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
plugins=(git osx github git-extras svn mvn npm brew history)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

function v() {
  if [ -e "$1" ]
  then
    mvim -p --remote-tab-silent $1
  else
    mvim -p --remote-tab-silent 'New File'
  fi
}

function smarthosts() {
    sudo cp /etc/hosts /etc/hosts.bak
    sudo curl http://smarthosts.googlecode.com/svn/trunk/hosts -o /etc/hosts
    colordiff /etc/hosts.bak /etc/hosts
}

function ip() {
    ipconfig getpacket en0 | grep yiaddr | awk '{print $3}' | pbcopy
}

# Customize to your needs...
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -la"
# alias v=mvim -p --remote-tab-silent "%*"
alias b="/Applications/Brackets\ Sprint\ 24.app/Contents/MacOS/Brackets "
alias mci="mvn clean install "
alias mcd="mvn clean deploy "
alias hosts="sudo mvim /etc/hosts"
alias zshrc="v ~/.zshrc"
alias vimrc="v ~/.vimrc"
alias http="python -m SimpleHTTPServer"

alias push-g="git checkout gh-pages && git merge master && git push origin gh-pages && git checkout master"
alias push-m="git push origin master"

alias pull-g="git pull origin gh-pages"
alias pull-m="git pull origin master"

alias gitlab-config='git config --local user.name "偏右" && git config --local user.email "xingmin.zhu@alipay.com"'

alias dw="spm doc watch"
alias db="spm doc build"
alias dp="spm doc publish"
alias st="spm test"
alias spm-old="~/Projects/spmjs/spm/bin/spm"

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

export NODE_PATH=/usr/local/lib/node_modules

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

. ~/.spm_completion
