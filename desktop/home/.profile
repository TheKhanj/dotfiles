. $HOME/.config/shell/rc.sh

[ -z "$DISPLAY" ] &&
	[ "$(tty)" = /dev/tty1 ] &&
	[ $USER != 'root' ]

start_desktop=$?
if [ $start_desktop -eq 0 ]; then
	init_exports
	exec startx
else
	setup_shell
fi
