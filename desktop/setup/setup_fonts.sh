#!/usr/bin/env sh

. $HOME/dotfiles/desktop/home/.profile

if [ hostname != 'peach' ]; then
  return
fi

as_root rm -rf /etc/fonts/
as_root cp fonts/* /etc/fonts/
