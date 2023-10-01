#!/usr/bin/env sh

. $HOME/dotfiles/shell/.config/shell/rc.sh

as_root rm -rf /etc/fonts/
as_root mkdir /etc/fonts
as_root cp -r fonts/* /etc/fonts/
