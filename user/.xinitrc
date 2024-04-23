xrandr --auto
xrdb -merge "$HOME/.Xresources"
systemctl --user start desktop.target
i3
systemctl --user stop desktop.target

# vi: ft=sh
