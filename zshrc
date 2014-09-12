# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afc163"

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
plugins=(svn git osx github git-extras mvn node npm brew atom history)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs..

# PATH
export NODE_PATH=/usr/local/lib/node_modules
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Home/Contents
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# aliases
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -la"
alias b="/Applications/Brackets\ Sprint\ 24.app/Contents/MacOS/Brackets "
alias mci="mvn clean install "
alias mcd="mvn clean deploy "
alias hosts="sudo mvim /etc/hosts"
alias zshrc="v ~/.zshrc"
alias vimrc="v ~/.vimrc"
alias push-g="git checkout gh-pages && git merge master && git push origin gh-pages && git checkout master"
alias push-m="git push origin master"
alias pull-g="git pull origin gh-pages"
alias pull-m="git pull origin master"
alias gitlab-config='git config --local user.name "偏右" && git config --local user.email "xingmin.zhu@alipay.com"'
alias dw="spm doc watch"
alias db="spm doc build"
alias dp="spm doc publish"
alias gfw="python /Users/afc163/Projects/goagent/local/proxy.py"
alias spm2="/Users/afc163/Projects/spmjs/spm2/bin/spm"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

function v() {
  if [ -e "$1" ]
  then
    mvim -p --remote-tab-silent $1
  else
    mvim -p --remote-tab-silent 'New File'
  fi
}

function ip() {
    ipconfig getpacket en0 | grep yiaddr | awk '{print $3}' | pbcopy
}

function http() {
  if [ -e "$1" ]
  then
    python -m SimpleHTTPServer &
    open "http://127.0.0.1:8000/$1"
  else
    python -m SimpleHTTPServer
  fi
}

function xgrep() {
  find . \( -path "./.git" -o -path "./.atom" -o -path "./node_modules" \) -prune -o -type f -name '*' | xargs grep "$1"
}

. ~/.spm_completion
