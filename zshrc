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
plugins=(svn git macos github git-extras mvn node npm brew history zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs..

# aliases
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -la"
alias hosts="sudo code /etc/hosts"
alias gitlab-config='git config --local user.name "偏右" && git config --local user.email "xingmin.zhu@antfin.com"'
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
export TERM=xterm-256color
alias zshrc="code ~/.zshrc"
alias vimrc="code ~/.vimrc"

function v() {
  if [ -e "$1" ]
  then
    mvim -p --remote-tab-silent $1
  else
    mvim -p --remote-tab-silent 'New File'
  fi
}

function ip() {
  ipconfig getpacket en0 | grep yiaddr | awk '{print $3}'
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

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}

function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_rsa.pub
}

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function replaceall() {
  sed -i "" "s/$1/$2/g" `grep $1 -rl ./`
}

function dash() {
  open dash://$1;
}

# 往服务器的当前同名分支拉取推送代码
function push() {
  if [ -z $1 ] ; then
    git rev-parse --abbrev-ref HEAD | xargs git push origin;
  else
    git push origin $1;
  fi
}

# 从服务器的当前同名分支拉取最新代码
function pull() {
  if [ -z $1 ] ; then
    git rev-parse --abbrev-ref HEAD | xargs git pull origin;
  else
    git pull origin $1;
  fi
}

# 和服务器的当前同名分支同步
function sync() {
  if [ -z $1 ] ; then
    git rev-parse --abbrev-ref HEAD | xargs git pull origin;
    git rev-parse --abbrev-ref HEAD | xargs git push origin;
  else
    git pull origin $1;
    git push origin $1;
  fi
}

# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
function fq() {
   if [ $1 = "on" ]; then
      export http_proxy=http://127.0.0.1:7890
      export https_proxy=http://127.0.0.1:7890
      export all_proxy=socks5://127.0.0.1:7890
      echo "$fg[green]🚀 开启代理$fg[reset]: http://127.0.0.1:7890"
   fi

   if [ $1 = "off" ]; then
      unset http_proxy
      unset https_proxy
      unset all_proxy
      echo "$fg[red]🚀 关闭代理$fg[reset]: http://127.0.0.1:7890"
   fi
}

function pp() {
   proxy=$(lsof -i -n -P | grep LISTEN |grep AliMgrSoc | tr -s ' ' | cut -d' ' -f 9)
   echo "阿里郎代理：$proxy"
   polipo socksParentProxy=$proxy
}

# export ALL_PROXY=socks5://127.0.0.1:1080
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="/Users/afc163/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/usr/local/mongodb/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
