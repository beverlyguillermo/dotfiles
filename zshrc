# Install coreutils -- brew install coreutils
alias ls='gls --l --color'

export PATH="/usr/local/sbin:$HOME/.bin:$PATH"
eval "$(starship init zsh)"  # https://starship.rs
eval "$(direnv hook zsh)" # https://direnv.net
. $HOME/.asdf/asdf.sh # https://asdf-vm.com
