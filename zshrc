# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gnzh"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler heroku rails3 redis-cli powder git-flow cyanglee rvm autojump rbenv) 

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# color tmux
alias tmux="TERM=screen-256color-bce tmux"

# turn off auto correct
unsetopt correct_all

# colored highlighting is awesome
alias ls='gls -Fh --color=auto'
alias ll='gls -alFh --color=auto'
alias grep='grep --color=auto'
alias h='history'

# ruby / rails
# alias rs='unicorn_rails -p 3000'
alias rr='rake routes'
alias reset_db='rake db:drop;rake db:create;rake db:migrate;rake db:seed;'
alias p='powder'
alias rake="noglob rake"

# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqldump='/usr/local/mysql/bin/mysqldump'

export HISTFILESIZE=30000

# ssh
alias tunnel_andover='ssh -N -f -L 3307:localhost:3306 andover'

# misc
alias ctags="`brew --prefix`/bin/ctags"

# rbenv
eval "$(rbenv init -)"

# custom functions
search ()
{
    if [ $# -ne 1 ]; then
        echo "please specify the file name to search";
        exit 0;
    else
        # echo "Matching file found: --> ";
        find . -name "$1" | awk '{print "Matching file found: --> " $1}'
    fi
}

findkinf ()
{
    find . -type f -exec grep -l "$1" {} \;
}

listkinf ()
{
    find . -type f -exec grep -n "$1" {} \;
}
