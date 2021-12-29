[ -n "$SHELL_UTILS" ] && return || SHELL_UTILS=1

is_linux() {
  [ "$OS" != 'windows' ]
}

is_root() {
  [ "$EUID" -eq 0 ]
}

get_shell() {
  if [ -n "$BASH" ]; then
    echo 'bash'
    return
  fi

  local shell=`echo "$SHELL" | rev | cut -d/ -f1 | rev`
  echo $shell
}

as_root() {
  local admin
  if which doas > /dev/null; then
    admin="$(which doas)"
  else
    admin="$(which sudo)"
  fi

  $($admin $@)
}

is_laptop() {
  host="$(hostname)"
  [ "$host" = 'peach' ] || [ "$host" = 'birikht' ] || [ "$host" = 'buddy' ]
}

does_have_battery() {
  is_laptop
}
