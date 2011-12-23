# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

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
plugins=(git brew bundler heroku rails3 redis-cli powder git-flow cyanglee rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/kenneth/.rvm/gems/ruby-1.9.3-head@global/bin:/Users/kenneth/.rvm/gems/ruby-1.9.3-head@global/bin:/Users/kenneth/.rvm/rubies/ruby-1.9.3-head/bin:/Users/kenneth/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export VIM_APP_DIR=/usr/local/Cellar/macvim/7.3-57

[[ -s "/Users/kenneth/.rvm/scripts/rvm" ]] && source "/Users/kenneth/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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

# mongodb
alias start_mongo='mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf'
