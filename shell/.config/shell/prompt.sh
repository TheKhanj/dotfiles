#!/usr/bin/env zsh
. $HOME/.config/shell/utils.sh

get_pwd() {
  printf '~'
}

paint_red() {
  echo -n '%B%F{red}'
}

paint_green() {
  echo -n '%B%F{green}'
}

reset_color() {
  echo -n '%f%b'
}

dir_prompt() {
  if is_root; then
    paint_red
  else
    paint_green
  fi

  get_pwd
  reset_color
}

dir_prompt
