#!/usr/bin/env sh

. $HOME/dotfiles/shell/.config/shell/rc.sh

if [ hostname != 'peach' ]; then
  return
fi

as_root rm -rf /etc/fonts/
as_root cp fonts/* /etc/fonts/
