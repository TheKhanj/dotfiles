[ -n "$PROFILE_LOADED" ] && return || PROFILE_LOADED=1

as_root() {
	local admin
	if which doas >/dev/null; then
		admin="$(which doas)"
	else
		admin="$(which sudo)"
	fi

	$($admin $@)
}

is_laptop() {
	host="$(hostname)"
	[ "$host" = 'peach' ] ||
		[ "$host" = 'birikht' ] ||
		[ "$host" = 'buddy' ]
}

init_aliases() {
	alias r="source ranger"
}

init_colors() {
	# Normal Colors
	export BLACK=$'\033[0;30m'  # Black
	export RED=$'\033[0;31m'    # Red
	export GREEN=$'\033[0;32m'  # Green
	export YELLOW=$'\033[0;33m' # Yellow
	export BLUE=$'\033[0;34m'   # Blue
	export PURPLE=$'\033[0;35m' # Purple
	export CYAN=$'\033[0;36m'   # Cyan
	export WHITE=$'\033[0;37m'  # White

	# Bold
	export BOLD_BLACK=$'\033[1;90m'  # Black
	export BOLD_RED=$'\033[1;91m'    # Red
	export BOLD_GREEN=$'\033[1;92m'  # Green
	export BOLD_YELLOW=$'\033[1;93m' # Yellow
	export BOLD_BLUE=$'\033[1;94m'   # Blue
	export BOLD_PURPLE=$'\033[1;95m' # Purple
	export BOLD_CYAN=$'\033[1;96m'   # Cyan
	export BOLD_WHITE=$'\033[1;97m'  # White

	# Background
	export BG_BLACK=$'\033[40m'  # Black
	export BG_RED=$'\033[41m'    # Red
	export BG_GREEN=$'\033[42m'  # Green
	export BG_YELLOW=$'\033[43m' # Yellow
	export BG_BLUE=$'\033[44m'   # Blue
	export BG_PURPLE=$'\033[45m' # Purple
	export BG_CYAN=$'\033[46m'   # Cyan
	export BG_WHITE=$'\033[47m'  # White

	# Background Bold
	export BOLD_BG_BLACK=$'\033[100m'  # Black
	export BOLD_BG_RED=$'\033[101m'    # Red
	export BOLD_BG_GREEN=$'\033[102m'  # Green
	export BOLD_BG_YELLOW=$'\033[103m' # Yellow
	export BOLD_BG_BLUE=$'\033[104m'   # Blue
	export BOLD_BG_PURPLE=$'\033[105m' # Purple
	export BOLD_BG_CYAN=$'\033[106m'   # Cyan
	export BOLD_BG_WHITE=$'\033[107m'  # White

	export COLOR_RESET=$'\033[m' # Color Reset
}

dir_prompt() {
	printf "%s@%s: " "$USER" "$(hostname)"
}

init_prompt() {
	export PS1="$(dir_prompt)"
}

init_exports() {
	export PATH="$PATH:$HOME/bin"
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:$HOME/.cargo/bin"
	export PATH="$PATH:$HOME/.volta/bin"
	export PATH="$PATH:$HOME/go/bin"

	[ -n "$TMUX" ] && export TERM='tmux-256color'

	export VISUAL=nvim
	export EDITOR=$VISUAL
	export TERMINAL=xfce4-terminal
	export LESS='-R -S -z 5'
	export PAGER=less
	export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
	export BLOCK_SIZE=human-readable
	export BROWSER=chromium
	export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

	export PHP_CS_FIXER_IGNORE_ENV=1
}

init_less_colors() {
	export LESS_TERMCAP_mb=$BOLD_YELLOW
	export LESS_TERMCAP_md=$BOLD_GREEN
	export LESS_TERMCAP_so=$BOLD_RED
	export LESS_TERMCAP_us=$BOLD_YELLOW
	export LESS_TERMCAP_se=$(
		tput rmso
		tput sgr0
	)
	export LESS_TERMCAP_me=$WHITE
	export LESS_TERMCAP_ue=$(
		tput rmul
		tput sgr0
	)
	export LESS_TERMCAP_mr=$(tput rev)
	export LESS_TERMCAP_mh=$(tput dim)
	export LESS_TERMCAP_ZN=$(tput ssubm)
	export LESS_TERMCAP_ZV=$(tput rsubm)
	export LESS_TERMCAP_ZO=$(tput ssupm)
	export LESS_TERMCAP_ZW=$(tput rsupm)
	export GROFF_NO_SGR=1
}

enable_vi_mode() {
	set -o vi
	bind '"kj": "\e"'
}

setup_shell() {
	init_aliases
	init_colors
	init_prompt
	init_exports
	init_less_colors
	enable_vi_mode
}

[ -z "$DISPLAY" ] &&
	[ "$(tty)" = /dev/tty1 ] &&
	[ $USER != 'root' ] &&
	startx
