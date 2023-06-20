#!/usr/bin/env sh

. $HOME/.config/shell/rc.sh

export DISPLAY=':0'
export XORG_SESSION='desktop'

sxhkd_window=0
dunst_window=1
picom_window=2
keyboard_window=3
nm_applet_window=4
ssh_window=5

create_tmux_session() {
	tmux new-session -d -s "$XORG_SESSION"
}

kill_tmux_session() {
	tmux kill-session -t "$XORG_SESSION"
}

start_utils() {
	bootstrap_keyboard $keyboard_window &
	bootstrap_touchpad &
	nitrogen --restore &
}

start_sxhkd() {
	target="$XORG_SESSION:$sxhkd_window"
	tmux rename-window -t "$target" 'sxhkd'
	tmux send-keys -t "$target" 'unset TMUX TMUX_PANE' C-m
	tmux send-keys -t "$target" 'sxhkd' C-m
}

start_nm_applet() {
	target="$XORG_SESSION:$nm_applet_window"
	tmux new-window -t "$target" -n 'nm-applet'
	tmux send-keys -t "$target" 'nm-applet' C-m &
}

start_dunst() {
	target="$XORG_SESSION:$dunst_window"
	tmux new-window -t "$target" -n 'dunst'
	tmux send-keys -t "$target" 'dunst' C-m
}

start_picom() {
	target="$XORG_SESSION:$picom_window"
	tmux new-window -t "$target" -n 'picom'
	tmux send-keys -t "$target" 'picom --config ~/.config/picom.conf' C-m
}

start_ssh() {
	target="$XORG_SESSION:$ssh_window"
	tmux new-window -t "$target" -n "ssh"
	tmux send-keys -t "$target" 'ssh -D 9050 -N root@us -p 443' C-m
}

check_for_critical_battery_level() {
	charge=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
	status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)
	last_battery_check_file='/tmp/last_battery_check'
	last_battery="$(cat $last_battery_check_file 2>/dev/null)"

	if [ "$status" != "Charging" ]; then
		if [ "$charge" -lt 10 ] &&
			[ "$last_battery" != "$charge" ]; then
			notify-send -u critical "Critical battery level $charge%"
		fi
	fi
	echo -n "$charge" >$last_battery_check_file
}

interval() {
	while true; do
		check_for_critical_battery_level
		sleep 5
	done
}

bootstrap() {
	create_tmux_session
	start_utils
	start_sxhkd
	start_dunst
	start_picom
	start_nm_applet
	start_ssh

	interval &
	INTERVAL_PID=$!
}

debootstrap() {
	kill_tmux_session
	kill $INTERVAL_PID
}

main() {
	bootstrap
	i3
	debootstrap
}

main
