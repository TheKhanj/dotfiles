[ -n "$SHELL_UTILS" ] && return || SHELL_UTILS=1

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
