#
# Samples of what you can do in *.after.zsh files.
# You can create as many files as you like, or put everything in one.
#

# define your own aliases or override those provided by YADR.
# alias ls='ls -lAhFG'
# $alias hosts='sudo vim /private/etc/hosts'


# set or override options. two of my favorite are below.


# Automatically cd to frequently used directories http://robots.thoughtbot.com/post/10849086566/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME/Dropbox/code)

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
unsetopt correct_all

# Set history size
export HISTFILESIZE=1000
# Sync history file
export PROMPT_COMMAND='history -a'

# rbenv
eval "$(rbenv init -)"

# java home
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# export PATH
export PATH=/Users/kenneth/git-repo/dotfiles/:$PATH

# source my alias file
. ~/git-repo/dotfiles/aliases
