# Install coreutils -- brew install coreutils
alias ls='gls --l --color'

export PATH="/usr/local/sbin:$HOME/.bin:$PATH"

# https://starship.rs
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# https://direnv.net
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# https://asdf-vm.com
if command -v asdf &>/dev/null; then
  . $HOME/.asdf/asdf.sh
fi
