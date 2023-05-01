#!/usr/bin/env sh

cd desktop && ./install.sh && cd - >/dev/null || exit 1

stow -vt "$HOME" git &&
	stow -vt "$HOME" litecli &&
	stow -vt "$HOME" mpv &&
	stow -vt "$HOME" nvim &&
	stow -vt "$HOME" ranger &&
	stow -vt "$HOME" ripgrep &&
	stow -vt "$HOME" root &&
	stow -vt "$HOME" sqlite &&
	stow -vt "$HOME" tmux &&
	stow -vt "$HOME" xfce4 &&
	stow -vt "$HOME" zathura &&
	stow -vt "$HOME" digikala &&
	stow -vt "$HOME" jetbrains &&
	stow -vt "$HOME" mycli &&
	stow -vt "$HOME" clang ||
	exit 1

stow -vt "$HOME" shell || exit 1
ln -s ~/git/zsh-autosuggestions ~/git/ohmyzsh/custom/plugins 2>/dev/null
ln -s ~/git/zsh-system-clipboard ~/git/ohmyzsh/custom/plugins 2>/dev/null
