#!/usr/bin/env sh

icons_directory="$HOME/.local/share/icons"
current_directory="$HOME/dotfiles/desktop/setup"

if ! [ -d "$icons_directory" ]; then
	mkdir -p "$icons_directory"
fi

are_icons_installed() {
	[ -d "$icons_directory/Adwaita" ]
}

install_icons() {
	tar xvf "$current_directory/icons/Adwaita.tar.gz" \
		-C "$icons_directory" \
		>/dev/null
}

if ! are_icons_installed; then
	install_icons
fi
