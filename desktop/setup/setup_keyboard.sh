#!/usr/bin/env sh
. $HOME/dotfiles/desktop/home/.profile

touchcursor_template="$HOME/dotfiles/desktop/setup/keyboard/touchcursor_template"

get_keyboards() {
  # TODO: probably open fzf for choosing the keyboard
  grep -E 'Name=|Handlers=|EV=' /proc/bus/input/devices \
    | grep -B2 EV='12001' --no-group-separator \
    | grep 'Name=' \
    | cut -c 4- \
    | cut -d\" -f2
}

create_touchcursor_config() {
  keyboards="$(get_keyboards)"
  path="$HOME/.config/touchcursor"

  mkdir -p "$path"

  echo "$keyboards" | while read -r keyboard_name; do
    echo $keyboard_name
    cat "$touchcursor_template" \
      | sed "s/%KEYBOARD_NAME%/$keyboard_name/" \
      > "$path/${keyboard_name}.conf"
  done
}

copy_layout() {
  as_root cp $HOME/dotfiles/desktop/setup/keyboard/layout /usr/share/X11/xkb/symbols/custom
}

create_touchcursor_config
copy_layout
