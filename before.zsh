#
# Samples of what you can do in *.before.zsh files.
# You can create as many files as you like, or put everything in one.
#

# append your own plugins. the $plugins at the end includes the plugins
# defined by YADR.
plugins=(osx git brew bundler heroku rails3 redis-cli powder git-flow cyanglee rvm autojump rbenv node vagrant zsh-syntax-highlighting history-substring-search $plugins)

# ignore plugins defined by YADR and use your own list. Notice there is no
# $plugins at the end.

# set your theme.
ZSH_THEME="macovsky-ruby"
