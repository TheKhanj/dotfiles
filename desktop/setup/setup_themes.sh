#!/usr/bin/env sh

current_directory="$HOME/dotfiles/desktop/setup"
themes_directory="$HOME/.local/share/themes"

are_themes_installed() {
  [ -d "$themes_directory/Adwaita" ] \
    && [ -d "$themes_directory/Adwaita-dark" ]
}

install_themes() {
  tar -xvf "$current_directory/theme/Adwaita.tar.gz" \
    -C "$themes_directory" \
    > /dev/null
}

if ! [ -d "$themes_directory" ]; then
  mkdir -p "$themes_directory"
fi

if ! are_themes_installed; then
  install_themes
fi
