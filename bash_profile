function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to committ comm (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  local git_status="`git status -unormal 2>&1`"
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
  fi
}
#export PS1="\[\033[0;35m\]\u \[\033[0;37m\]at \[\033[0;33m\]\h\[\033[0;37m\]:\[\033[0;34m\]\$(date +%H:%M)\[\033[0;37m\] in \[\033[0;32m\]\w\[\033[0;34m\] \$(parse_git_branch) \n\[\033[0;37m\]$\[\033[0m\] "
export PS1="\[\033[0;35m\]\u \[\033[0;37m\]at \[\033[0;33m\]\h\[\033[0;37m\] \[\033[0;37m\]in \[\033[0;32m\]\w\[\033[0;34m\] \$(parse_git_branch) \n\[\033[0;37m\]$\[\033[0m\] "
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LS_COLORS='di=1;36:fi=0:ln=4;34:pi=5:so=4;5:bd=5:cd=5:or=4;91:mi=4;92:ex=35:*.rb=90'

[[ -s "/Users/beverlyguillermo/.rvm/scripts/rvm" ]] && source "/Users/beverlyguillermo/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

