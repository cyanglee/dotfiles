#
# Samples of what you can do in *.after.zsh files.
# You can create as many files as you like, or put everything in one.
#

# define your own aliases or override those provided by YADR.
# alias ls='ls -lAhFG'
# $alias hosts='sudo vim /private/etc/hosts'


# set or override options. two of my favorite are below.


# Automatically cd to frequently used directories http://robots.thoughtbot.com/post/10849086566/cding-to-frequently-used-directories-in-zsh
#setopt auto_cd
#cdpath=($HOME/Dropbox/code)

# Fancy globbing http://linuxshellaccount.blogspot.com/2008/07/fancy-globbing-with-zsh-on-linux-and.html
setopt extendedglob

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Speed up git completion
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
  _wanted files expl 'local files' _files
}

# Always pushd when changing directory
setopt auto_pushd

# turn off auto correct
# unsetopt correct_all
unsetopt correct

# Set history options
HISTSIZE=1000
HISTFILESIZE=1000
HISTTIMEFORMAT='%F %T '
# Sync history file
export PROMPT_COMMAND='history -a'

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# java home
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# export PATH
export PATH=/Users/cyanglee/git-repo/dotfiles:$PATH
export PATH=/Users/cyanglee/bin:$PATH

# Maven
# export M2_HOME=/usr/share/maven
export PATH=$M2_HOME/bin:$PATH
export MAVEN_OPTS="-Xms512m -Xmx1024m"

# initiate a python web server in the current directory
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}

# go path
export GOPATH=~/workspace/go
# source my alias file
. ~/workspace/dotfiles/aliases

# npm
export PATH=/usr/local/share/npm/bin:$PATH

# hub
# eval "$(hub alias -s)"

# torquebox
export JAVA_HOME=`/usr/libexec/java_home`
# Java 7
# export JAVA_OPTS="-Xms512m -Xmx4g -XX:MaxPermSize=1g"
# Java 8
export JAVA_OPTS="-Xms1g -Xmx4g"
export TORQUEBOX_HOME=$HOME/.immutant/current
export JRUBY_HOME="$HOME/.immutant/current/jruby"
# export JRUBY_OPS="--profile.api"
# export JRUBY_OPTS=-J-Xmx2048m
# export LEIN_JVM_OPTS="-Xms2G -Xmx2G"
export PATH=$PATH:$TORQUEBOX_HOME/jruby/bin
export JBOSS_HOME="$HOME/.immutant/current/jboss/"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=./bin:$PATH

# andriod
export PATH=${PATH}:/Users/cyanglee/Downloads/adt-bundle-mac-x86_64-20140321/sdk/platform-tools:/Users/cyanglee/Downloads/adt-bundle-mac-x86_64-20140321/sdk/tools

# rvm
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# for vagrant
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
echo "sourced my zsh custom file"

# for bower
alias bower='noglob bower'

# tumuxinator
source ~/.bin/tmuxinator.zsh

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aws
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.4.0
export PATH=~/.local/lib/aws/bin:${PATH}:$EC2_HOME/bin
export AWS_ACCESS_KEY=AKIAIEQ3OUAKG6QJ4ZCQ
export AWS_SECRET_KEY=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
source /usr/local/share/zsh/site-functions/_aws

# eval "$(jenv init -)"
# imagemagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
