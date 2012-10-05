function parse_hg_branch {
# ☿
  local hg_status=`hg status`
}

function parse_git_branch {
  local git_status="`git status -unormal 2>&1`"
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/± [ \1 ]/"
    else
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/± [ \1* ]/"
    fi
  fi
}
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LS_COLORS='di=1;36:fi=0:ln=4;34:pi=5:so=4;5:bd=5:cd=5:or=4;91:mi=4;92:ex=35:*.rb=90'

[[ -s "/Users/beverlyguillermo/.rvm/scripts/rvm" ]] && source "/Users/beverlyguillermo/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

export PS1="\[\033[0;35m\]\u\[\033[0;37m\] at \[\033[0;33m\]\h\[\033[0;37m\]:\[\033[0;34m\]\$(date +%H:%M)\[\033[0;37m\] in \[\033[0;32m\]\w\[\033[0;34m\] \$(parse_git_branch) \n\[\033[0;37m\]$\[\033[0m\] "
#export PS1="\[\033[0;44m\]\u\[\033[0;37m\] at \[\033[0;33m\]\h\[\033[0;37m\] \[\033[0;37m\]in \[\033[0;32m\]\w\[\033[0;34m\] \$(parse_git_branch) \n\[\033[0;37m\]$\[\033[0m\] "
#

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 002

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Colors
export TERM="xterm-256color"
alias  tmux="tmux -2"
