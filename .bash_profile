export PS1="[\[\033[0;37m\]\u@\h:\[\033[1;32m\]\$(date +%H:%M)\[\033[0;37m\]:\w\[\033[1;37m\]]\n$\[\033[0m\] "
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LS_COLORS='di=1;36:fi=0:ln=4;34:pi=5:so=4;5:bd=5:cd=5:or=4;91:mi=4;92:ex=35:*.rb=90'

[[ -s "/Users/beverlyguillermo/.rvm/scripts/rvm" ]] && source "/Users/beverlyguillermo/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

