. $HOME/.config/shell/utils.sh
if ! is_linux; then
  alias apt="apt-cyg"
  alias nvim="XDG_CONFIG_HOME='C:\cygwin64\home\PKhani\dotfiles\nvim\.config' nvim"
fi

alias r="source ranger"
alias feh='feh --scale-down'

GRC_ALIASES=true
test -f "/etc/profile.d/grc.sh" && source /etc/profile.d/grc.sh
