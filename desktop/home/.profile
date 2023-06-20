[ -z "$DISPLAY" ] &&
	[ "$(tty)" = /dev/tty1 ] &&
	[ $USER != 'root' ] &&
	startx
