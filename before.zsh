#
# Samples of what you can do in *.before.zsh files.
# You can create as many files as you like, or put everything in one.
#

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# java home
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# append your own plugins. the $plugins at the end includes the plugins
# defined by YADR.
plugins=(osx git brew bundler heroku rails3 redis-cli powder git-flow cyanglee rvm autojump rbenv node vagrant zsh-syntax-highlighting history-substring-search sublime zeus cap $plugins)

# set your theme.
# ZSH_THEME="macovsky-ruby"
ZSH_THEME="powerline"
