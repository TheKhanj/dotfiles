__setup_fzf() {
	local key_bindings='/usr/share/fzf/key-bindings.bash'
	local completion='/usr/share/fzf/completion.bash'

	[ -f $completion ] && source "$completion"
	[ -f $key_bindings ] && source "$key_bindings"

	bind -m vi-command '"\C-f": "\C-z\ec\C-z"'
	bind -m vi-insert '"\C-f": "\C-z\ec\C-z"'
	bind -r "\ec"
}

__paste_from_clipboard() {
	local shift=$1

	local head=${READLINE_LINE:0:READLINE_POINT+shift}
	local tail=${READLINE_LINE:READLINE_POINT+shift}

	local paste=$(xclip -out -selection clipboard)
	local paste_len=${#paste}

	READLINE_LINE=${head}${paste}${tail}
	let READLINE_POINT+=$paste_len+$shift-1
}

__yank_line_to_clipboard() {
	echo -n "$READLINE_LINE" | xclip -in -selection clipboard
}

__kill_line_to_clipboard() {
	__yank_line_to_clipboard
	READLINE_LINE=""
}

__setup_bash_clipboard() {
	bind -m vi-command -x '"P": __paste_from_clipboard 0'
	bind -m vi-command -x '"p": __paste_from_clipboard 1'
	bind -m vi-command -x '"yy": __yank_line_to_clipboard'
	bind -m vi-command -x '"dd": __kill_line_to_clipboard'
}

__setup_shell() {
	. "$HOME/.profile"
	[ -n "$TMUX" ] && export TERM='tmux-256color'
	local hostname="$(hostname)"
	export PS1="$(printf "%s@%s:\w\$ " "$USER" "$hostname")"

	set -o vi

	__setup_fzf
	__setup_bash_clipboard
}

n() {
	[ "${NNNLVL:-0}" -eq 0 ] || {
		echo "nnn is already running"
		return
	}
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	command nnn -uHAd "$@"

	[ ! -f "$NNN_TMPFILE" ] || {
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" >/dev/null
	}
}

__setup_shell

# vi: ft=bash
