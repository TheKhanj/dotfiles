#!/usr/bin/env sh

. $HOME/dotfiles/desktop/setup/setup_fonts.sh
. $HOME/dotfiles/desktop/setup/setup_icons.sh
. $HOME/dotfiles/desktop/setup/setup_themes.sh
. $HOME/dotfiles/desktop/setup/setup_keyboard.sh

stow -vt ~ home
